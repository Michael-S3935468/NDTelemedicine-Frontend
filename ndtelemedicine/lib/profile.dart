import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
              child: const Text('{Put User Name Here}',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.width*0.4,
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 25, right: 5),
                      child: Image.asset('images/PFP.png',
                      fit: BoxFit.fill,
                      )
                    ),
                ),
                Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 25, left: 5),
                      color: Colors.grey,
                      height: MediaQuery.of(context).size.width*0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(padding: EdgeInsets.all(15),
                          child: Text("Biological Information",
                            style: TextStyle(
                                fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text("Sex: Male",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Inter',
                              ),),
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text("Age: 47, years old",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Inter',
                              ),),
                          ),
                        ],
                      ),
                    )
                )
              ],
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
              child: const Text('Upcoming Appointments',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Inter',
                  )
              ),
            ),
            Column(
                children: [
                  Container(margin: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                  color: Colors.grey,
                  child: ListTile(
                    title: Text("12 September 2022"),
                    subtitle: Text("Dr. Rivera @ 2:00 pm"),
                  )
                  ),
                  Container(margin: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                      color: Colors.grey,
                      child: ListTile(
                        title: Text("Appointment 2"),
                      )
                  )
                ],
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
              child: const Text('Recently Reported Symptoms',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Inter',
                  )
              ),
            ),
            Column(
              children: [
                Container(margin: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                    color: Colors.grey,
                    child: ListTile(
                      title: Text("Symptom 1"),
                    )
                ),
                Container(margin: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                    color: Colors.grey,
                    child: ListTile(
                      title: Text("Symptom 2"),

                    )
                )
              ],
            )

          ],


        ),
      ),



    );
  }
}
