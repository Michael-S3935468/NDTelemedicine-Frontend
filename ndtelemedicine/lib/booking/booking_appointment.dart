import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ndtelemedicine/state_models/Session.dart';
import 'package:provider/provider.dart';

import '../state_models/Booking.dart';
import 'booking-api/api_service.dart';
import 'booking_confirm.dart';
import '../state_models/Appointment.dart';

class BookingAppointmentPage extends StatefulWidget {
  final DateTime bookingDate;
  final String? jwt;

  const BookingAppointmentPage({
    Key? key,
    required this.bookingDate,
    required this.jwt,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BookingAppointmentPageState();
}

class _BookingAppointmentPageState extends State<BookingAppointmentPage> {
  late List<Appointment>? _appointments = [];
  bool _loading = true;

  // Get appointments
  @override
  void initState() {
    super.initState();
    _getAppointments();
  }

  void _getAppointments() async {
    _appointments =
        (await BookingAPI().getAppointments(widget.bookingDate, widget.jwt))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    _loading = false;
  }

  @override
  Widget build(BuildContext context) {
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
      body: // Display list of appointments if any
          (_loading)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    // Header
                    Container(
                      alignment: Alignment.topLeft,
                      margin:
                          const EdgeInsets.only(left: 25, right: 25, top: 25),
                      child: const Text('Select a Time Slot',
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

                    // Display date of the following appointments
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: Center(
                        child: Text(
                          DateFormat('d MMMM y').format(widget.bookingDate),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                        child: ListView(
                      children: [
                        (_appointments!.isNotEmpty)
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: _appointments?.length,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        _buildList(_appointments![index]),
                              )
                            : const Center(
                                child: Text(
                                    "There are no appointments available on this day"),
                              )
                      ],
                    ))
                  ],
                ),
    );
  }

  // Widget that displays available appointments
  Widget _buildList(Appointment appointment) {
    return Consumer2<Booking, Session>(
        builder: (context, booking, session, child) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xFFD9D9D9),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.only(top: 15),
          title: Column(
            children: [
              Center(
                child: Text(appointment.label),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextButton(
                    onPressed: () {
                      booking.setNewAppointment(appointment);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              BookingAppointmentConfirmationPage(
                                  jwt: session.jwt)));
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      primary: Colors.white,
                      fixedSize: Size(MediaQuery.of(context).size.width, 50),
                    ),
                    child: const Text("Available")),
              )
            ],
          ),
        ),
      );
    });
  }
}
