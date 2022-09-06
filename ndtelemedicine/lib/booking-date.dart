import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  @override
  Widget build(BuildContext context) {


    return Material(
      child: Column(
        children: <Widget> [
          Text(
            DateFormat('d MMMM y').format(widget.bookingDate),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Inter',
              fontStyle: FontStyle.normal,
            ),
          ),

          // Available Appointments list
          // TODO: Convert to custom widget to display appointments from database
          ListView(
            shrinkWrap: true,
            children: <Widget> [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                // padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFFD9D9D9),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.only(top: 15),
                  // tileColor: Colors.green,
                  title: Column(
                    children: [
                      const Center(
                        child: Text("10:30am - 10:45am"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.green,
                              primary: Colors.white,
                              fixedSize: Size(MediaQuery.of(context).size.width,50),
                            ),
                            child: const Text("Available")
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                // padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFFD9D9D9),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.only(top: 15),
                  // tileColor: Colors.green,
                  title: Column(
                    children: [
                      const Center(
                        child: Text("10:45am - 11:00am"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.green,
                              primary: Colors.white,
                              fixedSize: Size(MediaQuery.of(context).size.width,50),
                            ),
                            child: const Text("Available")
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],

      )
    );
  }

}

