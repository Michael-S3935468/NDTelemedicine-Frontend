import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/appointment.dart';

class BookingDate extends StatefulWidget {
  final DateTime bookingDate;

  const BookingDate({
    Key? key,
    required this.bookingDate,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BookingDateState();
}

class _BookingDateState extends State<BookingDate> {
  List<Appointment> appointments = [];

  // Get appointments
  @override
  void initState() {
    for (var element in appointList) {
      appointments.add(Appointment.fromJson(element));
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
            child: Image.asset('images/Header-Base.png'),
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(25),
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
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: appointments.length,
                      itemBuilder: (BuildContext context, int index) =>
                          _buildList(appointments[index]),
                    ),
                  ],
                )
            )
          ],
        ),
    );
  }

  // Widget that displays available appointments
  Widget _buildList(Appointment list) {
    if (list.booked != "booked") {
      return Builder(builder: (context) {
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
                  child: Text(list.time),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: (list.booked == "available") ? Colors.green : Colors.red,
                        primary: Colors.white,
                        fixedSize: Size(MediaQuery.of(context).size.width, 50),
                      ),
                      child: Text(
                          (list.booked == "available") ? "Available" : "Cancel"
                      )
                  ),
                )
              ],
            ),
          ),
        );
      });
    }
    return const SizedBox();
  }
}
