import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import '../../../helper_widgets/constans.dart';
import '../../../../core/navigator_helper.dart';
import '../../../helper_widgets/app_input.dart';
import '../../../helper_widgets/app_loading.dart';
import '../../data/forget_password/bloc.dart';
import '../confirm_code/view.dart';
import '../login/view.dart';
import '../../../main/presentation/widgets/custom_top_auth.dart';
class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});
  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}
class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final _form = GlobalKey<FormState>();
  final blocevent= GetIt.I<ForgetPasswordBloc>();
  @override
  Widget build(BuildContext context) {
    final  phoneController= TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Padding(
          padding:  EdgeInsets.all(8.0.sp),
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 SizedBox(height: 45.h,),
                const CustomTopAuth(
                  text1: "نسيت كلمة المرور",
                  text2: "أدخل رقم الجوال المرتبط بحسابك"),
                 SizedBox(height: 20.h,),
                AppInputView(
                  controller: phoneController,
                   validator: (value) {

                  (() {
                    if (value!.isEmpty) {
                      "phone must be not empty";
                    }
                     });
                  return null;
                  }, isPhone: true,
                ),
                 SizedBox(height: 45.h,),
                BlocConsumer<ForgetPasswordBloc,ForgetPasswordStates>(
                  bloc: blocevent,
                   listener:(context,state) {
                      if (state is ForgetPasswordSucessState){
                                   Fluttertoast.showToast(msg: "تم الارسال بنجاح",
                                   fontSize: 12,backgroundColor: Colors.black,textColor: Colors.white
                                      );
                                   navigateTo(ConfirmCodeView(
                                     type:'forget_password',
                                       phone: phoneController
                                   ));
                      }
                      else if(state is ForgetPasswordFailedState){
                         Fluttertoast.showToast(msg: "حقل الهاتف مطلوب",
                         fontSize: 12,backgroundColor: Colors.black,textColor: Colors.white
                         );}},

                  builder: (BuildContext context, ForgetPasswordStates state) {
                     if(state is ForgetPasswordLoadingState){
                       return const AppLoadingView();
                     }
                   return ElevatedButton(onPressed: () {
                     blocevent.add(ForgetPasswordEvent(phoneNumber: phoneController.text));

                    },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.circular(
                                    16.r))),
                        child: Text("تأكيد رقم الجوال",
                            style: kTextStyle16.copyWith(color: Colors.white)));

                  }),
                 SizedBox(height: 30.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 const  Text(
                    "لديك حساب بالفعل؟",
                    style: kTextStyle15,
                  ),
                  TextButton(
                    onPressed: () {
                      navigateTo(const LoginView());
                    },
                    child:  Text(
                      "تسجيل الدخول",
                      style: kTextStyle16
                      ),
                    ),

                ],
              )
            ],),
          ),
        )
    );
  }
}
