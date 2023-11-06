import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../config/app_constant.dart';
import '../model/meeting_model.dart';

var client= http.Client();


class MeetingService {
 
// static Future<String> getZoomMeetingUrl(String appointmentId) async {
//   final response = await http.get(Uri.parse('$userGetMeeting/$appointmentId'));

//   if (response.statusCode == 200) {
//     // If the server returns a 200 OK response, parse the JSON.
//     MeetingModel meeting = MeetingModel.fromJson(jsonDecode(response.body));
//     return meeting.zoomMeetingUrl;
//   } else {
//     // If the server did not return a 200 OK response, throw an exception.
//     throw Exception('Có lỗi khi lấy URL cuộc họp Zoom');
//   }
// }
static Future<MeetingModel> fetchMeetingModel(String appointmentId) async {
  final response = await http.get(
    Uri.parse('$userGetMeeting/$appointmentId'), 
  );

  var jsonResponse = jsonDecode(response.body);
  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, print and parse the JSON.
    print('Server response: ${response.body}');
    MeetingModel meeting = MeetingModel.fromJson(jsonDecode(response.body));
    return meeting;
  } else {
    // If the server did not return a 200 OK response, throw an exception.
    throw Exception(jsonResponse['error']);
  }
}

  static Future<String> getSocketId() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('socketId') ?? '';
}

  Future<http.Response> joinMeeting(String appointmentId, String userId, String socketId) async {
   
    final response = await http.post(
      Uri.parse(userJoinMeeting),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'appointmentId': appointmentId,
        'userId': userId,
        'socketId': socketId,
      }),
    );
   var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['type'] == 'JOINED_MEETING') {
            // Save the socketId in SharedPreferences
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('socketId', jsonResponse['data']['socketId']);
        }
        return response;
    } else {
      // If the server did not return a 200 OK response, throw an exception.
       throw Exception(jsonResponse['error']);
    }
  }
}