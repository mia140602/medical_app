import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/model/review_model.dart';
import 'package:medical_app/services/review_service.dart';


import '../../common/review_cart.dart';

class DoctorReview extends StatefulWidget {
  final String doctorId;


  
  const DoctorReview({super.key, required this.doctorId});

  @override
  State<DoctorReview> createState() => _DoctorReviewState();
}

class _DoctorReviewState extends State<DoctorReview> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đánh giá'),
      ),
      
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              SizedBox(height: 20.h,),
              SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: FutureBuilder<List<ReviewModel>>(
                  future: getDoctorReviews(widget.doctorId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        // Nếu không có đánh giá nào, hiển thị thông báo
                        return Text('Chưa có đánh giá');
                      } else {
                        // Nếu có đánh giá, hiển thị chúng
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ReviewCard(
                              name: snapshot.data![index].user.nickName??'Loading', 
                              review: snapshot.data![index].review, 
                              rate: snapshot.data![index].rating.toString(),
                            );
                          },
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
        
                    // By default, show a loading spinner.
                    return CircularProgressIndicator();
                  },
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}