class NotificationModel {
  final String id;
  final String userId;
  final String message;
  final DateTime date;
  final bool read;
  bool isRead;

  NotificationModel({required this.id,required this.userId,required this.message,required this.date,required this.read, this.isRead=false});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['_id'],
      userId: json['userId'],
      message: json['message'],
      date: DateTime.parse(json['date']),
      read: json['read'],
    );
  }
}