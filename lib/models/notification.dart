class NotificationModel {
  final String? title;
  final String? body;
  final DateTime? date;
  String? imagePath;

  NotificationModel(
      {required this.title,
      required this.body,
      required this.date,
      required this.imagePath});
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
      'date': date,
      'imagePath': imagePath,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'],
      body: map["body"],
      date: map["date"],
      imagePath: map["mapPath"],
    );
  }
}
