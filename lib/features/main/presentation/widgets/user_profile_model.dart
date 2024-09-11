import 'dart:io';
import 'package:driver/core/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../helper_widgets/constans.dart';
import '../../../helper_widgets/app_image.dart';
import '../../../helper_widgets/app_input.dart';
import '../../data/my_profile/bloc.dart';
import 'editPasswordSheet.dart';

class UserDataModel extends StatefulWidget {
  const UserDataModel({super.key});

  @override
  State<UserDataModel> createState() => _UserDataModelState();
}

class _UserDataModelState extends State<UserDataModel> {
  final event = EditProfileEvent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 26.h,
          ),
          TextFormField(
            controller: event.nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return "name must be not empty";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
                prefixIcon: Container(
                  height: 0.122,
                  margin: const EdgeInsets.all(12.5),
                  child: const AppImage(
                      url: "User.png", width: 0.1, height: 0.122),
                ),
                hintStyle: kTextStyle16light,
                hintText: CacheHelper.userName),
          ),
          SizedBox(
            height: 20.h,
          ),
          AppInputView(
            isPhone: true,
            hintText: CacheHelper.phoneNumber,
            controller: event.phoneController,
            validator: (value) {
              if (value!.isEmpty) {
                return "password must be not empty";
              } else if (value.length < 7) {
                return "password must ba more than 7";
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return ('برجاء ادخال اسم المدينه');
              }
              return null;
            },
            controller: event.cityController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[\u0600-\u06FF]'))
            ],
            decoration: InputDecoration(
              prefixIcon: Container(
                height: 0.122,
                margin: const EdgeInsets.all(12.5),
                child:
                    const AppImage(url: "flag.png", width: 0.1, height: 0.122),
              ),
              hintText: ' اسم المدينه',
              hintStyle: kTextStyle15light,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.r),
                                  topLeft: Radius.circular(30.r))),
                          child: const EditProfileSheet()));
                },
              );
            },
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [BoxShadow()],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(22.r),
              ),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'تغيير كلمه المرور',
                      style: kTextStyle15light,
                    ),
                    Spacer(),
                    Icon(Icons.arrow_circle_left_outlined)
                  ]),
            ),
          ),
          SizedBox(
            height: 12.h,
          )
        ],
      ),
    );
  }

  Future<XFile?> pickImage() async {
    final ImagePicker imagePicker = ImagePicker();

    final returnedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      // selectedImage= File(returnedImage!.path);
      event.image = File(returnedImage!.path);
    });
    return null;
  }
}
