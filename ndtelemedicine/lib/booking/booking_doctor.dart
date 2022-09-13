import 'package:flutter/material.dart';
import 'package:ndtelemedicine/booking/booking_calendar.dart';

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
            )
          )
        ],
      ),
    );
  }

  // Widget that displays Doctors
  Widget _buildList(Doctor doctor) {
    return Builder(builder: (context) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xFFD9D9D9),
        ),
        child: ListTile(
          leading: Icon((doctor.gender == "Male") ? Icons.man : Icons.woman),
          title: Text(doctor.name),
          subtitle: Text("${doctor.specialist}\n${doctor.gender}"),
          trailing: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BookingCalendarPage(doctor: doctor),
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
