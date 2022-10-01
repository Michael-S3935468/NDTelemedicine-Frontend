import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ndtelemedicine/main.dart';
import 'package:provider/provider.dart';

import '../state_models/Booking.dart';

class BookingAppointmentConfirmationPage extends StatelessWidget {
  const BookingAppointmentConfirmationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Booking>(builder: (context, booking, child) {
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
              child: const Text('Confirm Booking',
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

            // Confirmation Information
            Expanded(
                child: Column(
              children: [
                const Icon(
                  Icons.event_available,
                  size: 100,
                ),
                const Text(
                  "Please confirm your Booking",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Text(
                  "with",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Dr. ${booking.doctor?.name}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Text(
                  "on",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  DateFormat('d MMMM y')
                      .format(booking.booking?.start as DateTime),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Text(
                  "from",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  booking.booking?.label as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ],
            )),

            // Confirmation button
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(50),
              child: Column(
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      booking.endSession();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MyHomePage(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      primary: Colors.white,
                      fixedSize: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? Size(MediaQuery.of(context).size.width, 50)
                          : Size(MediaQuery.of(context).size.width * 0.3, 50),
                    ),
                    child: const Text("Book Appointment"),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
