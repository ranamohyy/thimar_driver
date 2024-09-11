import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper_widgets/constans.dart';
import '../../../helper_widgets/app_image.dart';
import '../../../helper_widgets/app_input.dart';

class BodyRegisterUserDetails extends StatefulWidget {
    BodyRegisterUserDetails({super.key, required this.nameController, required this.phoneNumber, required this.cityController, required this.indentityNumber, required this.email, required this.password, required this.passwordConfirmation,});

int ?index;
   final TextEditingController nameController;
   final TextEditingController phoneNumber;
   final TextEditingController cityController;
   final TextEditingController indentityNumber;
   final TextEditingController email;
   final TextEditingController password;
   final TextEditingController passwordConfirmation;

   @override
  State<BodyRegisterUserDetails> createState() => _BodyRegisterUserDetailsState();
}
class _BodyRegisterUserDetailsState extends State<BodyRegisterUserDetails> {
  @override
  Widget build(BuildContext context) {
    return
       Column (
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisSize: MainAxisSize.min,
         children: [
          TextFormField(
            controller:widget.nameController ,
            validator: (value) {
              if( value!.isEmpty){
                return "name must be not empty";
              }else {return null;}
            },   decoration: InputDecoration(
              prefixIcon: Container(
                height: 0.122,
                margin:const EdgeInsets.all(12.5),
                child: const AppImage(url:"User.png"
                    ,width: 0.1,height: 0.122
                ),
              ),
              hintStyle:kTextStyle15light,
              hintText:"اسم المندوب"

          ),
          ),
          SizedBox(height: 15.h,),
          AppInputView(
            isPhone: true,
            controller: widget.phoneNumber,
            validator: (value) {
              if (value!.isEmpty) {
                return "phone must be not empty";
              }
            },
          ),
          SizedBox(height: 15.h,),
          TextFormField(
             validator: (value){
           if(value!.isEmpty){
           return'    حقل المدينه مطلوب';
           }
           return null;},
            controller: widget.cityController,
            decoration:  InputDecoration(
              prefixIcon: Container(
                height: 0.122,
                margin:const EdgeInsets.all(12.5),
                child: const AppImage(url:"flag.png"
                    ,width: 0.1,height: 0.122
                ),
              ),
              hintText:"المدينة" ,
              hintStyle: kTextStyle15light,
            ),
          ),
          SizedBox(height: 15.h,),
          GestureDetector(
            onTap: (){},
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow:const [BoxShadow(blurRadius: 0.1)],
                borderRadius: BorderRadius.circular(16),
                 shape: BoxShape.rectangle

              ),
              child:const Row(
                children: [
                  AppImage(url: 'location.png',height: 28,width: 28,),
                  Text('تحديد الموقع علي الخريطه')
                ],
              ),
            ),
          ),
          SizedBox(height: 15.h,),
          AppInputView(isPhone: false,
            validator: (value){
              if(value!.isEmpty){
                return'رقم الهوية مطلوب';
              }
              return null;},
            keyboardType: TextInputType.number,
            controller: widget.indentityNumber,
            decoration: InputDecoration(
              prefixIcon: Container(
                height: 0.122,
                margin:const EdgeInsets.all(12.5),
                child: const AppImage(url:"id.png"
                    ,width: 0.1,height: 0.122
                ),
              ),
              hintText:"  رقم الهوية" ,
            ),),
          SizedBox(height: 15.h,),
          AppInputView(isPhone: false,
            validator: (value){
              if(value!.isEmpty){
                return'   الايميل مطلوب';
              }
              return null;},
            keyboardType: TextInputType.emailAddress,
            controller: widget.email,
            decoration: InputDecoration(
              prefixIcon: Container(
                height: 0.122,
                margin:const EdgeInsets.all(12.5),
                child: const AppImage(url:"email.png"
                    ,width: 0.1,height: 0.122
                ),
              ),
              hintText:" البريد الألكتروني" ,
            ),
          ),
          SizedBox(height: 15.h,),
          TextFormField(
            controller: widget.password,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty){
                return "password must be not empty";
              }else if (value.length<7){
                return "password must be more than 7";
              }else {
                return null;
              }
            } ,
            decoration: InputDecoration(
              prefixIcon: Container(
                height: 0.122,
                margin:const EdgeInsets.all(12.5),
                child: const AppImage(url:"Unlock.png"
                    ,width: 0.1,height: 0.122
                ),
              ),
              hintText:" كلمة المرور" ,
              hintStyle: kTextStyle15light,
            ),
          ),
          SizedBox(height: 15.h,),
          TextFormField(
            controller: widget.passwordConfirmation,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty){
                return "password must be not empty";
              }else if (value.length<7){
                return "password must be more than 7";
              }else {
                return null;
              }
            } ,
            decoration: InputDecoration(
              prefixIcon: Container(
                height: 0.122,
                margin:const EdgeInsets.all(12.5),
                child: const AppImage(url:"Unlock.png"
                    ,width: 0.1,height: 0.122
                ),
              ),
              hintText:"تأكيد كلمة المرور" ,
              hintStyle: kTextStyle15light,
            ),
          ),
          SizedBox(height: 14.h,),
                ],

           );
  }
}
