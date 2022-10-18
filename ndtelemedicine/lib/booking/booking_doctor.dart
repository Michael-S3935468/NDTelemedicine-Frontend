import 'package:flutter/material.dart';
import 'package:ndtelemedicine/booking/booking-api/api_service.dart';
import 'package:ndtelemedicine/booking/booking_calendar.dart';
import 'package:provider/provider.dart';

import '../state_models/Booking.dart';
import '../state_models/Doctor.dart';

class BookingDoctorPage extends StatefulWidget {
  final String? jwt;
  const BookingDoctorPage({Key? key, required this.jwt}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BookingDoctorPage();
}

class _BookingDoctorPage extends State<BookingDoctorPage> {
  List<Doctor> _doctors = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _getDoctors();
  }

  void _getDoctors() async {
    _doctors = (await BookingAPI().getDoctors(widget.jwt))!;
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
      body: (_loading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                // Header
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
                  child: const Text('Choose a Doctor',
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

                // Display list of Doctors
                Expanded(
                    child: ListView(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _doctors.length,
                      itemBuilder: (BuildContext context, int index) =>
                          _buildList(_doctors[index]),
                    ),
                  ],
                ))
              ],
            ),
    );
  }

  // Widget that displays Doctors
  Widget _buildList(Doctor doctor) {
    return Consumer<Booking>(builder: (context, booking, child) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xFFD9D9D9),
        ),
        child: ListTile(
          leading: Icon((doctor.sex == "Male") ? Icons.man : Icons.woman),
          title: Text("Dr. ${doctor.firstName} ${doctor.lastName}"),
          subtitle: Text(doctor.sex),
          trailing: TextButton(
            onPressed: () {
              booking.endSession();
              booking.setDoctor(doctor);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const BookingCalendarPage(),
                ),
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              primary: Colors.white,
            ),
            child: const Text("Book"),
          ),
        ),
      );
    });
  }
}
