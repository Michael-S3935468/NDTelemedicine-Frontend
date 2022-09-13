import 'package:flutter/material.dart';
import 'booking_doctor.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPage();
}

class _BookingPage extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
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
                crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 1 : 2,
                children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BookingDoctorPage(),
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
                ElevatedButton(
                  onPressed: null,
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
  }
}
