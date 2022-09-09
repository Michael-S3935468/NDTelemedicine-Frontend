import 'package:flutter/material.dart';
import 'package:ndtelemedicine/main.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static const appTitle = 'NDTelemedicine';

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: appTitle,
      home: _NotificationPage(),
      debugShowCheckedModeBanner: false,
    );

  }


}

class _NotificationPage extends StatelessWidget {
  const _NotificationPage({super.key});

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
        leading: 
          IconButton(onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MyHomePage(title: "ND Telemedicine"),
                  ),
                );
              },
              icon: const Icon(Icons.notifications)
        ),
      ),
    );
  }

}