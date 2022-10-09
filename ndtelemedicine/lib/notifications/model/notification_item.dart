import 'notification_list.dart';
import 'package:flutter/material.dart';

class NotifItem extends StatelessWidget {
  const NotifItem({
    required this.notifs,
  });

  final Notif notifs;

  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      title: Text(notifs.title),
      subtitle: Text(notifs.desc),
    );
  }
}
