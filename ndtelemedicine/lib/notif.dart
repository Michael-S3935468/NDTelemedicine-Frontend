import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ndtelemedicine/main.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static const appTitle = 'NDTelemedicine';

  @override
  Widget build(BuildContext context) {
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
    List<int> items = List<int>.generate(5, (int index) => index);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(21, 101, 192, 1),
          title: SizedBox(
            height: 30,
            child: Image.asset('images/Header-Base.png'),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(title: "ND Telemedicine"),
                  ),
                );
              },
              icon: const Icon(Icons.home)),
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(height: 25),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
              SizedBox(width: 25),
              Text('Recent Notifications',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: 'Inter',
                  )),
            ]),
            const Divider(
              thickness: 2,
              color: Color.fromRGBO(112, 112, 112, 1),
              indent: 25,
              endIndent: 25,
            ),
            Expanded(
              //
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  var item = items[index];
                  return Dismissible(
                    key: ValueKey(item),
                    background: Container(
                      color: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: AlignmentDirectional.centerStart,
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: AlignmentDirectional.centerEnd,
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        side:
                            BorderSide(color: Color.fromRGBO(112, 112, 112, 1)),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: ListTile(
                        title: Text("item $item"),
                        subtitle: Text("description here"),
                      ),
                    ),
                    onDismissed: (direction) {
                      items.removeAt(index);

                      // Show a snackbar of item that was deleted
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Item $item dismissed")));
                    },
                  );
                },
              ),
            )
          ],
        ));
  }
}
