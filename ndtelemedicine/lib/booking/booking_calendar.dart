import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:provider/provider.dart';

import '../state_models/Booking.dart';
import 'booking_appointment.dart';

class BookingCalendarPage extends StatefulWidget {

  const BookingCalendarPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BookingCalendarPageState();
}

class _BookingCalendarPageState extends State<BookingCalendarPage> {
  DateTime _selectedDate = DateTime.now();

  final DateTime _firstDate = DateTime.now();
  final DateTime _lastDate = DateTime.now().add(Duration(days: 42 - DateTime.now().weekday));

  Color selectedDateStyleColor = Colors.blue;
  Color selectedSingleDateDecorationColor = Colors.red;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    selectedDateStyleColor = Theme.of(context).colorScheme.onSecondary;
    selectedSingleDateDecorationColor = Theme.of(context).colorScheme.secondary;
  }

  @override
  Widget build(BuildContext context) {
    _noWeekend();
    // add selected colors to default settings
    dp.DatePickerRangeStyles styles = dp.DatePickerRangeStyles(
      selectedDateStyle: Theme.of(context)
          .textTheme
          .bodyText1
          ?.copyWith(color: selectedDateStyleColor),
      selectedSingleDateDecoration: BoxDecoration(
        color: selectedSingleDateDecorationColor,
        shape: BoxShape.circle,
      ),
      displayedPeriodTitle: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontFamily: 'Inter',
        fontStyle: FontStyle.normal,
      ),
      dayHeaderStyle: DayHeaderStyle(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(21, 101, 192, 1),
          border: Border.all(color: const Color(0xFF808080), width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(6)
        ),
      ),
      dayHeaderTitleBuilder: _dayHeaderTitleBuilder,
    );

    return Consumer<Booking>(
      builder: (context, booking, child){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(21, 101, 192, 1),
            title: SizedBox(
              height: 30,
              child: Image.asset('images/Header-Base.png'),
            ),
            centerTitle: true,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
            ],
          ),
          body: Flex(
            direction: MediaQuery.of(context).orientation == Orientation.portrait
                ? Axis.vertical
                : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              // Header
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
                child: const Text('Select a Date',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontFamily: 'Inter',
                    )),
              ),
              const Divider(
                thickness: 2,
                color: Color.fromRGBO(112, 112, 112, 1),
                indent: 25,
                endIndent: 25,
              ),

              // Calendar
              Expanded(
                child: dp.DayPicker.single(
                  selectedDate: _selectedDate,
                  onChanged: _onSelectedDateChanged,
                  firstDate: _firstDate,
                  lastDate: _lastDate,
                  datePickerStyles: styles,
                  datePickerLayoutSettings: const dp.DatePickerLayoutSettings(
                    dayPickerRowHeight: 60,
                    maxDayPickerRowCount: 2,
                    showPrevMonthEnd: true,
                    showNextMonthStart: true,
                  ),
                  selectableDayPredicate: _isSelectableCustom,
                ),
              ),

              // Button
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(50),
                child: Column(
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        booking.setDate(_selectedDate);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BookingAppointmentPage(bookingDate: _selectedDate),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        primary: Colors.white,
                        fixedSize: MediaQuery.of(context).orientation == Orientation.portrait
                            ? Size(MediaQuery.of(context).size.width,50)
                            : Size(MediaQuery.of(context).size.width*0.3, 50),
                      ),
                      child: Text("Book Appointment on: ${DateFormat('d MMMM, y').format(_selectedDate)}"),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }

    );


  }

  // if current day is a weekend, change the default selected date
  void _noWeekend() {
    setState(() {
      if (_selectedDate.weekday == 6) {
        _selectedDate = DateTime.now().add(const Duration(days: 2));
      } else if (_selectedDate.weekday == 7) {
        _selectedDate = DateTime.now().add(const Duration(days: 1));
      }
    });
  }

  // handler to change the date selected
  void _onSelectedDateChanged(DateTime newDate) {
    setState(() {
      _selectedDate = newDate;
    });
  }

  // makes the weekends not selectable
  bool _isSelectableCustom(DateTime day) {
    return day.weekday < 6;
  }

}

String _dayHeaderTitleBuilder(
    int dayOfTheWeek, List<String> localizedHeaders) =>
    localizedHeaders[dayOfTheWeek].substring(0, 3);