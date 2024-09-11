import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'customize_auth_header.dart';

class HeadWidget extends StatefulWidget {
 const HeadWidget({super.key, required this.phone, required this.pinController});
   final String phone;
final TextEditingController pinController ;

   @override
  State<HeadWidget> createState() => _HeadWidgetState();
}

class _HeadWidgetState extends State<HeadWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderView(text: "تفعيل الحساب", phoneNumber: widget.phone),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: PinCodeTextField(
              appContext: context,
              keyboardType: TextInputType.number,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              length: 4,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(15.r),
                fieldHeight: 60,
                fieldWidth: 70,
                inactiveColor: const Color(0xffF3F3F3),
                activeColor: Theme.of(context).primaryColor,
                activeFillColor: Colors.white,
              ),
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.white,
              validator: (value) {
                if (value!.length < 4) {
                  return "يرجي ملأ الجقول الفارغة";
                }
                return null;
              },
              controller: widget.pinController,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),


      ],


    );
  }
}
