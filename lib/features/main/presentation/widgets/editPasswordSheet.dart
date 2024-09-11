import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

import '../../../helper_widgets/constans.dart';
import '../../../helper_widgets/app_image.dart';
import '../../../helper_widgets/app_loading.dart';
import '../../data/my_profile/bloc.dart';

class EditProfileSheet extends StatefulWidget {
  const EditProfileSheet({super.key});

  @override
  State<EditProfileSheet> createState() => _EditProfileSheetState();
}

class _EditProfileSheetState extends State<EditProfileSheet> {
  final _form = GlobalKey<FormState>();

  final editPassword = GetIt.I<MyProfileBloc>();

  final event = EditPasswordEvent();
  FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Form(
            key: _form,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 12, right: 12, bottom: 4),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                TextFormField(
                  controller: event.oldPasswordController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "password must be not empty";
                    } else if (value.length < 7) {
                      return "password must be more than 7";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      height: 0.122,
                      margin: const EdgeInsets.all(12.5),
                      child: const AppImage(
                          url: "Unlock.png", width: 0.1, height: 0.122),
                    ),
                    hintText: 'old password',
                    hintStyle: kTextStyle15light,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                TextFormField(
                  controller: event.passwordController,
                  keyboardType: TextInputType.phone,
                  validator: (newValue) {
                    if (newValue!.isEmpty) {
                      return "password must be not empty";
                    } else if (newValue.length < 7) {
                      return "password must be more than 7";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      height: 0.122,
                      margin: const EdgeInsets.all(12.5),
                      child: const AppImage(
                          url: "Unlock.png", width: 0.1, height: 0.122),
                    ),
                    hintText: 'new password',
                    hintStyle: kTextStyle15light,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                TextFormField(
                  controller: event.passwordConfirmationController,
                  keyboardType: TextInputType.phone,
                  validator: (confirmValue) {
                    if (confirmValue!.isEmpty) {
                      return "password must be  not empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      height: 0.122,
                      margin: const EdgeInsets.all(12.5),
                      child: const AppImage(
                          url: "Unlock.png", width: 0.1, height: 0.122),
                    ),
                    hintText: 'confirmPassword',
                    hintStyle: kTextStyle15light,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                BlocConsumer<MyProfileBloc, ProfileStates>(
                    bloc: editPassword,
                    listener: (context, state) {
                      if (state is EditPasswordSuccessState) {
                        Fluttertoast.showToast(msg: state.msg);
                      }
                      if (state is EditPasswordFailureState) {
                        Fluttertoast.showToast(
                            msg: 'كلمة المرور القديمة غير صحيحة');
                      }
                    },
                    builder: (context, state) {
                      if (state is EditPasswordFailureState) {
                        Fluttertoast.showToast(
                            msg: 'كلمة المرور القديمة غير صحيحة');
                      }
                      if (state is EditPasswordLoadingState) {
                        return const AppLoadingView();
                      }
                      return ElevatedButton(
                          onPressed: () {
                            final valid = _form.currentState!.validate();
                            if (valid) {
                              editPassword.add(event);
                            }
                          },
                          child: const Text(
                            "تعديل كلمه المرور",
                            style: TextStyle(color: Colors.white),
                          ));
                    }),
              ]),
            )),
      ),
    );
  }
}
