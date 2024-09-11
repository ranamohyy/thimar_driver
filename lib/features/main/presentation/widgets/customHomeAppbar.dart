import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helper_widgets/constans.dart';
import '../../../helper_widgets/app_image.dart';
import '../../../helper_widgets/app_input.dart';
class CustomAppBarHome extends StatelessWidget implements PreferredSizeWidget
{
  const CustomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar (
        elevation: 0,
        backgroundColor: Colors.white,
        leading:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio:20.w/20.h ,
                  child:  AppImage(url: "logo.png",
                    height: 20.h,
                    width: 15.w,),
                ),
                const Text(
                  "سلة ثمار",
                  style: kTextStyle16,
                  textAlign: TextAlign.center,
                ),


              ]),
        ),
        leadingWidth: 140.w,
        title:const Text('الرئيسية',style: kTextStyle20,),
      bottom:  AppInputView(
        isPhone: false,
        decoration:const  InputDecoration(
          hintStyle:kTextStyle15light,
          prefixIcon: Icon(Icons.search,color: kPrimaryColor,size: 24,),
          hintText: 'ابحث عن ماتريد؟',
        ),


      ),

    );
  }

  @override
  Size get preferredSize =>const  Size.fromHeight(120);
}
