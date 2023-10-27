import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/config/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/notification_model.dart';
import '../../../services/notification_service.dart';
import '../../common/title_section.dart';

class AppNotification extends StatefulWidget {
 

  
  const AppNotification({super.key, });
  Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId')??'';
  }

  @override
  State<AppNotification> createState() => _AppNotificationState();
}

class _AppNotificationState extends State<AppNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 60.h, left: 20.w, right: 20.w, bottom: 60.h),
        child: Column(
          children: [
            TitleSection(text: "Thông báo", imagePaths: ["more.svg"],),
            Expanded(
              child: FutureBuilder<String>(
                future: widget.getUserId(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return FutureBuilder<List<NotificationModel>>(
                      future: fetchNotifications(snapshot.data!),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15), // Điều chỉnh giá trị này để thay đổi độ bo góc
                                ),
                                color:  AppColor.kTextField ,
                                child: ListTile(
                                  leading: Image.asset("assets/img/cancel.png"),
                                  title: Text(snapshot.data?[index].message ?? ''),
                                  subtitle: Text(snapshot.data?[index].date.toString() ?? ''),
                                ),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        // By default, show a loading spinner.
                        return const Center(child: CircularProgressIndicator());
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  // By default, show a loading spinner.
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
     
    );
  }
}