import 'package:flutter/material.dart';
import './model/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  late final User user;
  int symptomsPagination = 5;
  int appointmentsPagination = 5;

  @override
  void initState() {
    user = User.fromJson(userTest);
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
        children: <Widget>[

          // name header
          Container(
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
            child: Text('${user.firstName} ${user.lastName}',
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
                  color: Colors.blueAccent,
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
                          "Sex: ${user.gender}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "Age: ${user.age}, years old",
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
                (user.appointments.isNotEmpty)
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        (user.appointments.length > appointmentsPagination)
                            ? appointmentsPagination
                            : user.appointments.length,
                    itemBuilder: (BuildContext context, int index) =>
                        _buildListAppointments(user.appointments[index]),
                  )
                : const Center(
                    child: Text("You haven't report any symptoms recently"),
                  ),

                // if there are more elements to display
                (user.appointments.length > appointmentsPagination)
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
                (user.symptoms.isNotEmpty)
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: (user.symptoms.length > symptomsPagination)
                        ? symptomsPagination
                        : user.symptoms.length,
                    itemBuilder: (BuildContext context, int index) =>
                        _buildListSymptoms(user.symptoms[index]),
                  )
                : const Center(
                    child: Text("You haven't report any symptoms recently"),
                  ),

                // if there are more elements to display
                (user.symptoms.length > symptomsPagination)
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
  }

  // build list of upcoming appointments
  Widget _buildListAppointments(String list) {
    return Builder(builder: (context) {
      return Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
          color: Colors.blueAccent,
          child: ListTile(
            title: Text(list),
            subtitle: Text(list),
          ));
    });
  }

  // build list of recent symptoms
  Widget _buildListSymptoms(String list) {
    return Builder(builder: (context) {
      return Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
          color: Colors.blueAccent,
          child: ListTile(
            title: Text(list),
          ));
    });
  }
}
