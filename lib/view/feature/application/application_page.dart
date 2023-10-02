import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:medical_app/view/feature/application/application_widget.dart';
import 'package:medical_app/view/feature/application/bloc/app_blocs.dart';
import 'package:medical_app/view/feature/application/bloc/app_events.dart';
import 'package:medical_app/view/feature/application/bloc/app_states.dart';

import '../../../config/app_constant.dart';

class ApplicationPage extends StatefulWidget {
  
  const ApplicationPage({super.key,});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index=0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs,AppStates>(builder: (context, state){
      return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: buildPage(state.index),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.index,
            onTap: (value) {
              // setState(() {
              //   _index= value;
              // });
              context.read<AppBlocs>().add(TriggerAppEvent(value));
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColor.mainColor,
            items: bottomTabs,
          ),
        )
        ),
    );
    });
  }
}