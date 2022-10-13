import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ndtelemedicine/state_models/Appointment.dart';
import 'package:ndtelemedicine/state_models/Session.dart';
import 'package:ndtelemedicine/state_models/Symptom.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  int symptomsPagination = 5;
  int appointmentsPagination = 5;

  @override
  Widget build(BuildContext context) {
    return Consumer<Session>( builder: (context, session, child) {
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
          children: <Widget>[

            // name header
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
              child: Text('${session.patient.firstName} ${session.patient.lastName}',
                  style: const TextStyle(
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

            // profile picture
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                      height: MediaQuery.of(context).size.width * 0.4,
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 25, right: 5),
                      child: Image.asset('images/PFP.png',
                        fit: BoxFit.fill,
                      )
                  ),
                ),

                // user info box
                Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 25, left: 5),
                      color: Colors.lightBlue[200],
                      height: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Biological Information",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "Sex: ${session.patient.sex}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "Age: ${session.patient.age}, years old",
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                )
              ],
            ),

            // appointments list header
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
              child: const Text('Upcoming Appointments',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Inter',
                  )),
            ),

            // appointments list
            Expanded(
                child: ListView(
                  children: [
                    // display list if any recent symptoms
                    (session.patient.appointments.isNotEmpty)
                        ? ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                      (session.patient.appointments.length > appointmentsPagination)
                          ? appointmentsPagination
                          : session.patient.appointments.length,
                      itemBuilder: (BuildContext context, int index) =>
                          _buildListAppointments(session.patient.appointments[index]),
                    )
                        : const Center(
                            child: Text("You don't have any upcoming appointments"),
                    ),

                    // if there are more elements to display
                    (session.patient.appointments.length > appointmentsPagination)
                        ? ListTile(
                      title: TextButton(
                        onPressed: () => {
                          setState(() {
                            appointmentsPagination += 5;
                          })
                        },
                        child: const Text("Show more"),
                      ),
                    )
                        : const SizedBox(),
                  ],
                )
            ),

            // symptoms list header
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
              child: const Text('Recently Reported Symptoms',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Inter',
                  )),
            ),

            // symptoms list
            Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 25),
                  children: [
                    // display list if any recent symptoms
                    (session.patient.symptoms.isNotEmpty)
                        ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: (session.patient.symptoms.length > symptomsPagination)
                          ? symptomsPagination
                          : session.patient.symptoms.length,
                      itemBuilder: (BuildContext context, int index) =>
                          _buildListSymptoms(session.patient.symptoms[index]),
                    )
                        : const Center(
                      child: Text("You haven't report any symptoms recently"),
                    ),

                    // if there are more elements to display
                    (session.patient.symptoms.length > symptomsPagination)
                        ? ListTile(
                      title: TextButton(
                        onPressed: () => {
                          setState(() {
                            symptomsPagination += 5;
                          })
                        },
                        child: const Text("Show more"),
                      ),
                    )
                        : const SizedBox(),
                  ],
                )
            )
          ],
        ),
      );
    });

  }

  // build list of upcoming appointments
  Widget _buildListAppointments(Appointment appointment) {
    return Builder(builder: (context) {
      return Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
          color: Colors.lightBlue[200],
          child: ListTile(
            title: Text("${DateFormat('d MMMM, y').format(appointment.start)}, ${appointment.label}"),
            subtitle: Text("Dr. ${appointment.doctor.firstName} ${appointment.doctor.lastName}"),
          ));
    });
  }

  // build list of recent symptoms
  Widget _buildListSymptoms(Symptom symptom) {
    return Builder(builder: (context) {
      return Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
          color: Colors.lightBlue[200],
          child: ListTile(
            title: Text(symptom.symptom),
            subtitle: Text(DateFormat('d MMMM, y').format(symptom.reportDate)),
          )
      );
    });
  }
}
