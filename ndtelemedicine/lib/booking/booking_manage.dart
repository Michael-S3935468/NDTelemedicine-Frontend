import 'package:flutter/material.dart';

import 'model/appointment.dart';

class BookingManagePage extends StatefulWidget {
  const BookingManagePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BookingManagePage();
}

class _BookingManagePage extends State<BookingManagePage> {
  List<Appointment> userAppointments = [];

  // Get appointments
  @override
  void initState() {
    for (var element in appointList) {
      userAppointments.add(Appointment.fromJson(element));
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
                )
            ),
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
                (userAppointments.isNotEmpty)
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: userAppointments.length,
                        itemBuilder: (BuildContext context, int index) =>
                            _buildList(userAppointments[index]),
                      )
                    : const Center(
                        child: Text("You have no appointments booked"),
                      ),
              ],
            )
          )
        ],
      ),
    );
  }

  // Builder that builds the list of appointments
  Widget _buildList(Appointment list) {
    // Temporary Logic
    if (list.booked == "user") {
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
                  child: Text(list.date),
                ),
                Center(
                  child: Text(list.time),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: TextButton(
                          // TODO : Navigate to booking appointments page for same day and if booking confirmed, remove current booking
                          onPressed: null,
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            primary: Colors.white,
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.3, 50),
                          ),
                          child: const Text("Change Time")
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                      // TODO : Show dialog to confirm deletion and delete if accepted
                      child: TextButton(
                        onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: const Text("Cancel Appointment"),
                                  content: Text(
                                      "Please confirm the cancellation of your appointment with Dr. x on ${list.date} during ${list.time}"),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("I've Change my Mind")
                                    ),
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child:
                                            const Text("Confirm Cancellation")
                                    )
                                  ],
                                )
                        ),
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
    return const SizedBox();
  }
}
