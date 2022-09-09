import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:ndtelemedicine/booking-date.dart';

import 'booked-days.dart';

/// Page with [dp.DayPicker].
class BookingPage extends StatefulWidget {
  /// Custom events.
  final List<BookingDays> events;

  const BookingPage({
    Key? key,
    this.events = const [],
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime _selectedDate = DateTime.now();

  final DateTime _firstDate = DateTime.now();
  final DateTime _lastDate = DateTime.now().add(const Duration(days: 28));

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

    return Material(
      child: Flex(
        direction: MediaQuery.of(context).orientation == Orientation.portrait
            ? Axis.vertical
            : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: dp.DayPicker.single(
              selectedDate: _selectedDate,
              onChanged: _onSelectedDateChanged,
              firstDate: _firstDate,
              lastDate: _lastDate,
              datePickerStyles: styles,
              datePickerLayoutSettings: const dp.DatePickerLayoutSettings(
                dayPickerRowHeight: 75,
                // maxDayPickerRowCount: 6,
                // showPrevMonthEnd: true,
                // showNextMonthStart: true,
              ),
              selectableDayPredicate: _isSelectableCustom,
              eventDecorationBuilder: _eventDecorationBuilder,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(50),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => BookingDate(bookingDate: _selectedDate),
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

  void _onSelectedDateChanged(DateTime newDate) {
    setState(() {
      _selectedDate = newDate;
    });
  }

  // ignore: prefer_expression_function_bodies
  bool _isSelectableCustom(DateTime day) {
    return day.weekday < 6;
  }

  dp.EventDecoration? _eventDecorationBuilder(DateTime date) {
    List<DateTime> eventsDates =
    widget.events.map<DateTime>((e) => e.date).toList();

    bool isEventDate = eventsDates.any((d) =>
    date.year == d.year && date.month == d.month && d.day == date.day);

    BoxDecoration roundedBorder = BoxDecoration(
        border: Border.all(
          color: Colors.deepOrange,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(3.0)));

    return isEventDate
        ? dp.EventDecoration(boxDecoration: roundedBorder)
        : null;
  }
}

String _dayHeaderTitleBuilder(
    int dayOfTheWeek, List<String> localizedHeaders) =>
    localizedHeaders[dayOfTheWeek].substring(0, 3);