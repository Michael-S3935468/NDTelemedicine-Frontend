class Notif {
  String title;
  String desc;

  Notif({required this.title, required this.desc});

  static List<Notif> notifList = [
    Notif(title: "Appointment", desc: "Today, 1:30pm - Dr. N. Riveria"),
    Notif(title: "Medication", desc: "Today, 4:00pm - 1x Lipitor"),
    Notif(title: "Medication", desc: "Tomorrow, 8:00am - 1x Lipitor"),
    Notif(title: "Appointment", desc: "Tomorrow, 11:30am - Dr. R. Giambrone"),
  ];

  static List<Notif> getNotif() {
    return notifList;
  }
}
