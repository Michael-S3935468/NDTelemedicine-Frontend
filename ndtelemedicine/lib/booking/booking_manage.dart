import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ndtelemedicine/booking/booking_appointment.dart';
import 'package:ndtelemedicine/state_models/Session.dart';
import 'package:provider/provider.dart';

import '../state_models/Appointment.dart';
import '../state_models/Booking.dart';
import 'booking-api/api_service.dart';

class BookingManagePage extends StatefulWidget {
  final String? jwt;
  final int? id;
  const BookingManagePage({Key? key, required this.jwt, required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BookingManagePage();
}

class _BookingManagePage extends State<BookingManagePage> {
  late List<Appointment>? _appointments = [];

  // Get appointments
  @override
  void initState() {
    super.initState();
    _getBooked();
  }

  void _getBooked() async {
    _appointments = (await BookingAPI().getUserAppointments(widget.id, widget.jwt))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Session>(builder: (context, session, child) {
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
        body: Column(
          children: [
            // Header
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
              child: const Text('Your Appointments',
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
            Expanded(
                child: ListView(
              children: [
                // Display list of appointments booked by current user if any
                (_appointments) != null
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: _appointments?.length,
                        itemBuilder: (BuildContext context, int index) =>
                            _buildList(_appointments![index]),
                      )
                    : const Center(
                        child: Text("You have no appointments booked"),
                      ),
              ],
            ))
          ],
        ),
      );
    });
  }

  // Builder that builds the list of appointments
  Widget _buildList(Appointment appointment) {
    return Consumer2<Booking, Session>(builder: (context, booking, session, child) {
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
                child: Text(DateFormat('d MMMM y').format(appointment.start)),
              ),
              Center(
                child: Text(appointment.label),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: TextButton(
                        onPressed: () {
                          booking.endSession();
                          booking.setRemoveAppointment(appointment);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BookingAppointmentPage(
                                  bookingDate: appointment.start, jwt: session.jwt)));
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          primary: Colors.white,
                          fixedSize:
                              Size(MediaQuery.of(context).size.width * 0.3, 50),
                        ),
                        child: const Text("Change Time")),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                    child: TextButton(
                      onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                title: const Text("Cancel Appointment"),
                                content: Text(
                                    "Please confirm the cancellation of your appointment with Dr${appointment.doctor.firstName} ${appointment.doctor.lastName} on ${DateFormat('d MMMM y').format(appointment.start)} during ${appointment.label}"),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("I've Change my Mind")),
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Confirm Cancellation"))
                                ],
                              )),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        primary: Colors.white,
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * 0.3, 50),
                      ),
                      child: const Text(
                        "Cancel Appointment",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
