import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/model/review_model.dart';

Future<bool> submitReview(String doctorId, String userId, int rating, String review) async {
  final response = await http.post(
    Uri.parse(userpostReview),
    body: {
      'doctorId': doctorId,
      'userId': userId,
      'rating': rating.toString(),
      'review': review,
    },
  );

  if (response.statusCode == 201) {
    print('Review submitted successfully');
    return true;
  } else {
    throw Exception('Failed to submit review');
  }
}
Future<List<ReviewModel>> getDoctorReviews(String doctorId) async {
  final response = await http.get(Uri.parse('$userpostReview/$doctorId'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((item) => ReviewModel.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load reviews');
  }
}