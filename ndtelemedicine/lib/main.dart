import 'package:flutter/material.dart';
import 'profile/profile.dart';
import 'package:ndtelemedicine/booking/booking_main.dart';

import 'notifications/notification_page.dart';
import 'login/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'NDTelemedicine';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(21, 101, 192, 1),
          title: SizedBox(
            height: 30,
            child:  Image.asset('images/Header-Base.png'),
          ),
          centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => NotificationPage(),
                ),
              );
            }, icon: const Icon(Icons.notifications)
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('Home',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontFamily: 'Inter',
                        )
                    ),
                  ]
              ),
            ),
            const Divider(
              thickness: 2,
              color: Color.fromRGBO(112, 112, 112, 1),
              indent: 25,
              endIndent: 25,
            ),

            // Appointment Widget
            // TODO: Convert to custom widget to so it can be displayed conditionally and with relevant data
            Container(
              margin: const EdgeInsets.all(25),
              padding: const EdgeInsets.all(5),
              color: const Color.fromRGBO(215, 215, 216, 1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(Icons.warning_sharp, color: Colors.red, size: 40,)
                  ),
                  const Flexible(
                      child: Text("You have an appointment with Dr. N. Riviera in 15 minutes.")
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: const Color.fromRGBO(45, 125, 50, 1.0),
                    ),
                    onPressed: () { },
                    child: const Text('Attend'),
                  ),
                ],
              ),
            ),

            // Medication List Widget
            // TODO: Convert to custom widget to so it can be displayed with user's medication
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: const ExpansionTile(

                collapsedBackgroundColor: Color.fromRGBO(215, 215, 216, 1.0),
                backgroundColor: Color.fromRGBO(215, 215, 216, 1.0),
                leading: Icon(Icons.medication_outlined),
                title: Text('Medication For Today',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                    )
                ),
                children: <Widget>[
                  ListTile(title: Text('XYZ')),
                  ListTile(title: Text('XYZ')),
                  ListTile(title: Text('XYZ')),
                  ListTile(title: Text('XYZ')),
                  ListTile(title: Text('XYZ')),
                ],
              ),
            ),

            // Appointment List Widget
            // TODO: Convert to custom widget to so it can be displayed with user's appointments
            Container(
              margin: const EdgeInsets.all(25),
              child: const ExpansionTile(

                collapsedBackgroundColor: Color.fromRGBO(215, 215, 216, 1.0),
                backgroundColor: Color.fromRGBO(215, 215, 216, 1.0),
                leading: Icon(Icons.event),
                title: Text('Upcoming Appointments',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                    )
                ),
                children: <Widget>[
                  ListTile(title: Text('XYZ')),
                  ListTile(title: Text('XYZ')),
                  ListTile(title: Text('XYZ')),
                  ListTile(title: Text('XYZ')),
                  ListTile(title: Text('XYZ')),
                ],
              ),
            ),
          ],
        ),
      ),

      drawer: Drawer(

        width: MediaQuery.of(context).size.width * 0.77,
        child: Column(

        children: <Widget>[
            ListTile(
              leading: const Icon(Icons.menu, color: Colors.white),
              tileColor: const Color.fromRGBO(21, 101, 192, 1),
              dense: true,
              visualDensity: const VisualDensity(vertical: 2),
              onTap: () {},
              title: SizedBox(
                height: 30,
                child:  Image.asset('images/Header-Base.png', alignment: Alignment.centerRight,),
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {},
            ),
            const Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage())
                );
              },
            ),
            const Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text('Bookings'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BookingPage())
                );
              },
            ),
            const Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: const Icon(Icons.flag),
              title: const Text('Symptoms'),
              onTap: () {},
            ),
            const Divider(
              color: Colors.white,
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Sign Out'),
                  onTap: () {
                    // Produces error if tapped
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
                  },
                ),
              ),
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}

