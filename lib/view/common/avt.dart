import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Avatar extends StatelessWidget {
  double size;
  String img;
  double? circular;
   Avatar({super.key, required this.size, required this.img, this.circular});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(circular??16),
      child: Image.asset("assets/img/"+ img, width: size,),
    );
  }
}