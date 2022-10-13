import 'package:flutter/material.dart';
import 'package:ndtelemedicine/state_models/Session.dart';
import 'package:provider/provider.dart';
import 'booking_manage.dart';
import 'booking_doctor.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Session>(builder: (context, session, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(21, 101, 192, 1),
          title: SizedBox(
            height: 30,
            child:  Image.asset('images/Header-Base.png'),
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
              child: const Text('Booking',
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
                child: GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  crossAxisCount: 1,
                  children: [

                    // Button to navigate to book a new appointment
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BookingDoctorPage(jwt: session.jwt),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.event, size: 100),
                          Text("Book an Appointment",
                              style: TextStyle(fontSize: 15)
                          )
                        ],
                      ),
                    ),

                    // Button to navigate to manage appointments
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BookingManagePage(id: session.patient?.id, jwt: session.jwt),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.edit_calendar, size: 100),
                          Text("Manage your Appointments",
                              style: TextStyle(fontSize: 15)
                          )
                        ],
                      ),
                    ),
                  ],
                )
            )
          ],
        ),
      );
    });
  }
}
