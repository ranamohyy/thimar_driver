import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helper_widgets/constans.dart';
import '../../../helper_widgets/app_image.dart';

class CustomTopAuth extends StatelessWidget {
  const CustomTopAuth({super.key, required this.text1, required this.text2});
final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
   const AspectRatio(
       aspectRatio: .3/.10,
       child:  AppImage(url:
        "logo.png",
         fit: BoxFit.fill,
           ),
     ),
    Align(
    alignment: AlignmentDirectional.centerStart,
     child: Text(text1,
       // "مرحبا بك مرة أخرى",
       style: kTextStyle16.copyWith(fontSize: 17),
       textAlign: TextAlign.end,
     ),
   ),
    const SizedBox(height: 4,),
     Align(
    alignment: AlignmentDirectional.centerStart,
    child: Text(
      text2,
    // "يمكنك تسجيل الدخول الان",
    style: kTextStyle15light,
    ),
    ),
            SizedBox(
              height: 10.h,
            ),
    ]

    );
  }
}
