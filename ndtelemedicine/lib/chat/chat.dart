import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<StatefulWidget> createState() => _ChatPage();

}

class _ChatPage extends State<ChatPage> {


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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: Colors.black54)
              )
            ),
            padding: EdgeInsets.symmetric(vertical: 15),
            alignment: Alignment.center,
            child: Column(
              children: [
                Text("Appointment - Dr N. Riviera"),
                Text("02/04/22 @ 5:00 PM",
                style: TextStyle(
                  color: Colors.grey
                ),)
              ],
            )
          ),
          Expanded(
            child: ListTile(
              title: Text("text1"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Chat',
                  ),
                ),
              ),

            ],
          )

        ],
      ),
    );
  }

}