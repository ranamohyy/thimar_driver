import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constans.dart';
import 'app_image.dart';
class AppInputView extends StatelessWidget implements PreferredSizeWidget {

  final TextEditingController? controller;
  int? maxLines;
  int? minLines;
  final double ?width;
  final double ?height;
  final Widget? prefixIcon;
  final String? initialValue;
  final String? hintText;
  Widget? icon;
  bool isPhone=true ;
  final TextInputType? keyboardType;
  InputDecoration? decoration;
  final String? Function(String ?value)?validator;
 AppInputView ({super.key,this.hintText,  this.prefixIcon,this.initialValue,this.keyboardType,this.maxLines,this.minLines,
  this.width, this.decoration,this.icon, this.validator,  this.controller, this.height,required this.isPhone });
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child:
      TextFormField(

        minLines:minLines ,
        maxLines:maxLines ,
        initialValue: initialValue,
         keyboardType:isPhone? TextInputType.phone:keyboardType,
        validator:validator ,
             controller:controller ,
        decoration: isPhone?
        InputDecoration(
            hintStyle:kTextStyle15light,

            prefixIcon: Container(
            height: 0.122,

            margin:const EdgeInsets.all(12.5),
            child: const AppImage(url:"Phone.png"
                ,width: 0.1,height: 0.122
            ),
          ),
          hintText:hintText??"رقم الجوال" ,
          icon:  isPhone? GestureDetector (
            onTap: ()async{
              await showModalBottomSheet(context: context,
                builder: (context) => CountrySheet(
                  country:"Egypt" ,
                  flag:"saudi.png",height: 10.h,width: 20.w ,
                ),);
            },
            child: Container(
                height: 70.h,
                width: 60.w,
                child:
               const AspectRatio(
                  aspectRatio: 5.6/6,
                  child: AppImage(
                    fit: BoxFit.fill,
                    url: "saudi.png",
                   ),
                )
            ),
          ):icon


        ):decoration
          ),
    );

}

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>const Size.fromHeight(20);

}
class CountrySheet extends StatefulWidget {
  final String flag;
  final String country;
  final double? height;
  final double? width;

  const CountrySheet({super.key, required this.flag, required this.country, this.height, this.width});

  @override
  State<CountrySheet> createState() => _CountrySheetState();
}

class _CountrySheetState extends State<CountrySheet> {
  final list = [
    "السعودية",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) =>const Divider(),
      itemBuilder: (context, index) =>

          GestureDetector(
            onTap: (){

            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.h,
                    width: 50.w,
                    child: AppImage(url:
                    widget.flag,
                      height:widget.height ,
                      width:widget.width ,),
                  ),
                  SizedBox(width: 10.w,),
                  Text(list[index]),
                ],

              ),
            ),
          ),
      itemCount: list.length,

    );
  }
}
