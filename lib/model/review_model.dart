
import 'package:medical_app/model/user_model.dart';

class ReviewModel {
  final String id;
  final String doctorId;
  final UserModel user;
  final int rating;
  final String review;

  ReviewModel({
    required this.id,
    required this.doctorId,
    required this.user,
    required this.rating,
    required this.review,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['_id'],
      doctorId: json['doctorId'],
      user: UserModel.fromJson(json['userId']),
      rating: json['rating'],
      review: json['review'],
    );
  }
}