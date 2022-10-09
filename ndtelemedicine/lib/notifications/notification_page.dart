import 'package:flutter/material.dart';
import 'package:ndtelemedicine/main.dart';
import 'model/notification_item.dart';
import 'model/notification_list.dart';

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

  static const appTitle = 'NDTelemedicine';

  @override
  Widget build(BuildContext context) {
    // Create a list of items that would be used as an example for how removing notifications would work
    // List<int> items = List<int>.generate(5, (int index) => index);
    final List<Notif> notifs = Notif.getNotif();

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
                    builder: (context) => const MyHomePage(title: appTitle),
                  ),
                );
              },
              icon: const Icon(Icons.home)),
          actions: [
            // Button that displays a hint (via a closeable banner) on how to close a notification
            IconButton(
                onPressed: () =>
                    ScaffoldMessenger.of(context).showMaterialBanner(
                      MaterialBanner(
                          leading: const Icon(Icons.swipe_outlined),
                          padding: const EdgeInsets.all(20),
                          content: const Text("Swipe to dismiss notifications"),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Close'),
                              onPressed: () => ScaffoldMessenger.of(context)
                                  .hideCurrentMaterialBanner(),
                            ),
                          ]),
                    ),
                icon: const Icon(Icons.info))
          ],
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
                itemCount: notifs.length,
                itemBuilder: (context, index) {
                  // var item = items[index];
                  // Displays the list of items as removable list by swiping either left or right to remove the item
                  return Dismissible(
                    key: UniqueKey(),
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
                    // child: ListTile(
                    //   contentPadding:
                    //       const EdgeInsets.symmetric(horizontal: 20),
                    //   title: Text("item $item"),
                    //   subtitle: Text("item $item description here"),
                    // ),
                    child: NotifItem(notifs: notifs[index]),

                    onDismissed: (direction) {
                      notifs.removeAt(index);

                      // Show a snackbar (temporary banner) at the bottom of the screen to show that the item was deleted
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Notification dismissed")));
                    },
                  );
                },
              ),
            )
          ],
        ));
  }
}
