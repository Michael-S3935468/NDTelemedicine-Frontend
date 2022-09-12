import 'package:flutter/material.dart';
import 'package:ndtelemedicine/booking-calendar.dart';

import 'model/doctor.dart';

class BookingDoctorPage extends StatefulWidget {
  const BookingDoctorPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BookingDoctorPage();
}

class _BookingDoctorPage extends State<BookingDoctorPage> {
  List<Doctor> doctors = [];

  // Get appointments
  @override
  void initState() {
    for (var element in docList) {
      doctors.add(Doctor.fromJson(element));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(25),
            child: const Text('Choose a Doctor',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontFamily: 'Inter',
                )),
          ),
          Expanded(
              child: ListView(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: doctors.length,
                itemBuilder: (BuildContext context, int index) =>
                    _buildList(doctors[index]),
              ),
            ],
          ))
        ],
      ),
    );
  }

  // Widget that displays Doctors
  Widget _buildList(Doctor doctor) {
    return Builder(builder: (context) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xFFD9D9D9),
        ),
        child: ListTile(
          leading: const Icon(Icons.self_improvement),
          title: Text(doctor.name),
          subtitle: Text("${doctor.specialist}\n${doctor.gender}"),
          trailing: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BookingPage(doctor: doctor.name),
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
