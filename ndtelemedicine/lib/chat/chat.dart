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
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.exit_to_app_rounded),
          color: Colors.red,
          tooltip: "Leave Appointment",
        ),
        title: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                const Text("Dr N. Riviera"),
                const Text(
                  "02/04/22 @ 5:00 PM",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                )
              ],
            )),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: Stack(
        children: <Widget>[
          // TODO: Make this a function and display from database, below is the conditional formatting of each message

          // Container(
          //   margin: EdgeInsets.only(right: 50),
          //   padding:
          //   EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 5),
          //   child: Align(
          //     alignment: (messages[index].sender == "receiver"?Alignment.topLeft:Alignment.topRight),
          //     child: Container(
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(20),
          //           color: (messages[index].sencer  == "receiver"?Colors.grey.shade200:Colors.shade200),
          //       padding: EdgeInsets.all(16),
          //       child: Text(messages[index].body,
          //         style: TextStyle(fontSize: 15),
          //       ),
          //     ),
          //   ),
          // ),
          // Align(
          //   alignment: (messages[index].sender == "receiver"?Alignment.topLeft:Alignment.topRight),
          //   child: Padding(
          //     padding:
          //     EdgeInsets.only(left: 14, right: 14),
          //     child: Text(messages[index].sendTime),
          //   ),
          // ),


          ListView(
            children: [
              Container(
                margin: EdgeInsets.only(right: 50),
                padding:
                    EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 5),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade200),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:
                  EdgeInsets.only(left: 14, right: 14),
                  child: Text("{Put Message Time Here}"),
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 50),
                    padding:
                        EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 5),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue.shade200),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding:
                      EdgeInsets.only(left: 14, right: 14),
                      child: Text("{Put Message Time Here}"),
                    ),
                  ),
                ],
              ),

              // Component to take up space at the bottom so the text field is not covering parts of a message
              const SizedBox(height: 75)
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.blue,
                    elevation: 0,
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
