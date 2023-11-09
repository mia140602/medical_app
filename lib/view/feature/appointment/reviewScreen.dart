import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:medical_app/model/appointment_model.dart';
import 'package:medical_app/widgets/flutter_toast.dart';

import '../../../services/review_service.dart';
import '../application/application_page.dart';

class ReviewScreen extends StatefulWidget {
final AppointmentModel appointment;

  const ReviewScreen({super.key, required this.appointment});

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  double _rating = 0.0;
  final _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đánh giá bác sĩ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            TextField(
              controller: _reviewController,
              decoration: InputDecoration(
                labelText: 'Nhập đánh giá của bạn',
              ),
              maxLines: 5,
            ),
            ElevatedButton(
              onPressed:() async {
                bool isReviewSubmitted = await submitReview(
                  widget.appointment.doctor.id, 
                  widget.appointment.patientId, 
                  _rating.toInt(), 
                  _reviewController.text
                );
                if (isReviewSubmitted) {
                  toastInfo(msg: "Gửi đánh giá thành công");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ApplicationPage())
                  );
                } else {
                  toastInfo(msg: "Đánh giá không thành công");
                }
                },
              child: Text('Gửi đánh giá'),
            ),
          ],
        ),
      ),
    );
  }
}