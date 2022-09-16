import 'package:flutter/material.dart';
import 'profile/profile.dart';

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
        children: <Widget>[
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(width: 25),
              Text('Home',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontFamily: 'Inter',
                )
              ),
            ]
          ),
          const Divider(
            thickness: 2,
            color: Color.fromRGBO(112, 112, 112, 1),
            indent: 25,
            endIndent: 25,
          ),
          const SizedBox(height: 25),
          const SizedBox(width: 25),
          const ExpansionTile(
            leading: Icon(Icons.sentiment_very_satisfied),
            title: Text('Medication for Today',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Inter',
                )
            ),
            children: <Widget>[
              ListTile(title: Text('XYZ')),
            ],
          ),
        ],
      ),
      drawer: Drawer(

        //drawer Code
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
                  onTap: () {},
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

