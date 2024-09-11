import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper_widgets/constans.dart';
import '../../../helper_widgets/app_image.dart';
class HeaderView extends StatelessWidget {
  const HeaderView({super.key, required this.phoneNumber, required this.text});
  final String phoneNumber;
  final String text;
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
           AspectRatio(
        aspectRatio: .3/.10.r,
        child: const AppImage(url:
        "logo.png",
          fit: BoxFit.fill,
        ),),
      SizedBox(
        height: 22.h,
      ),
      Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(style: kTextStyle16.copyWith(fontSize: 17.sp),

          text,
          textAlign: TextAlign.end,
        ),
      ),
      SizedBox(
        height: 10.h,
      ),

          const Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          "أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال",
          style:kTextStyle16light
          ),
        ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start ,
        children: [
          Text(phoneNumber,
            style:kTextStyle16light,

             ),   TextButton(onPressed: (){},
              child:
              Text("تغيير رقم الجوال",
              style: kTextStyle16light.copyWith(color: kPrimaryColor,
              decorationColor:kPrimaryColor ,
              decoration: TextDecoration.underline)
         ))

        ],
      ),
      SizedBox(
        height: 22.h,
      ),

],);


  }
}
