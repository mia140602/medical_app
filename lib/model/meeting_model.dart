class MeetingModel {
  final String id;
  final String user;
  final String doctor;
  final String appointment;
  final DateTime startTime;
  final DateTime endTime;
  final String type;
  final bool isEnded;
  final String zoomMeetingUrl;

  MeetingModel({
    required this.id,
    required this.user,
    required this.doctor,
    required this.appointment,
    required this.startTime,
    required this.endTime,
    required this.type,
    required this.isEnded,
    required this.zoomMeetingUrl,

  });

  factory MeetingModel.fromJson(Map<String, dynamic> json) {
  return MeetingModel(
    id: json['id'] ?? '',
    user: json['user'] ?? '',
    doctor: json['doctor'] ?? '',
    appointment: json['appointment'] ?? '',
    startTime: DateTime.parse(json['startTime'] ?? DateTime.now().toString()),
    endTime: DateTime.parse(json['endTime'] ?? DateTime.now().toString()),
    type: json['type'] ?? '',
    isEnded: json['isEnded'] ?? false,
    zoomMeetingUrl: json['zoomMeetingUrl'] ?? '', 
  );
}

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'doctor': doctor,
      'appointment': appointment,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'type': type,
      'isEnded': isEnded,
      'zoomMeetingUrl': zoomMeetingUrl,
    };
  }
}