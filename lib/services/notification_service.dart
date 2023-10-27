import 'dart:convert';

import 'package:medical_app/config/app_constant.dart';

import '../model/notification_model.dart';
import 'package:http/http.dart' as http;

Future<List<NotificationModel>> fetchNotifications(String userId) async {
  try {
    final response = await http.get(Uri.parse("$getnotification/$userId"));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => NotificationModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load notifications with status code ${response.statusCode}');
    }
  } catch (e) {
    print(e);
    throw Exception('Failed to load notifications');
  }
}