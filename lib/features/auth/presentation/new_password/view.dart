import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import '../../../helper_widgets/constans.dart';
import '../../../../core/navigator_helper.dart';
import '../../../helper_widgets/app_image.dart';
import '../../../helper_widgets/app_loading.dart';
import '../../../main/presentation/home_nav/view.dart';
import '../../data/reset_password/bloc.dart';
import '../login/view.dart';
import '../../../main/presentation/widgets/custom_top_auth.dart';

class ResetPasswordView extends StatefulWidget {
  ResetPasswordView({super.key, required this.code, required this.phone});
  final String code;
  final String phone;

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final passwordController = TextEditingController();

  final passwordConfirmationController = TextEditingController();

  final bloc = GetIt.I<ResetPasswordBloc>();

  @override
  Widget build(BuildContext context) {
    final _form = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        padding:  EdgeInsetsDirectional.all(12.r),

        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            const CustomTopAuth(
            text1:" نسيت كلمة المرور",
            text2: 'أدخل كلمة المرور الجديدة',
          ),
          SizedBox(
            height: 22.h,
          ),

          TextFormField(
            controller: passwordController,
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
            decoration:  InputDecoration(
                label: Row(
                  children: [
                    AppImage(url: "Unlock.png",
                        width: 28.w, height: 28.h),
                    SizedBox(width: 8.w,),
                  const  Text("كلمة المرور",
                        style: kTextStyle16light),
                  ],
                )),
          ),
           SizedBox(height: 12.h,),
          TextFormField(
            controller: passwordConfirmationController,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (passwordController.text == value) {
                return "matched";
              }
              else {
                return "password not matched";
              }
            },
            decoration:  InputDecoration(
              label: Row(
                  children: [
                    AppImage(url: "Unlock.png",
                        width: 28.w, height: 28.h),
                    SizedBox(width: 8.w,), Text("تأكيد كلمة المرور",
                        style: kTextStyle16light
                    )
                  ]
              ),
            ),
          ),
           SizedBox(height: 15.h,),


          BlocConsumer(
            bloc: bloc,
            listener: (context, state) {
              if (state is ResetPasswordSuccessState) {
                Fluttertoast.showToast(
                    msg: " تم تغيير كلمة المرور بنجاح", fontSize: 12.sp);
                navigateTo(const HomeNavView(),keepHistory: false);
              } else if (state is ResetPasswordFailureState) {
                Fluttertoast.showToast(msg: state.errMessage, fontSize: 12.sp);
              }
            },
            builder: (context, state) {
    if (state is ResetPasswordLoadingState) {
    return const AppLoadingView();
    }
    return ElevatedButton(
    onPressed: () {
    bloc.add(ResetPasswordEvent(
    phone:widget.phone,
        Code:widget.code,
        password: passwordController.text));
    },
    child:  Text("تغيير كلمة المرور", style: kTextStyle15light,),
    );
    }    ),
               SizedBox(height: 30.h,),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text(
              "لديك حساب بالفعل ؟",
              style: kTextStyle15,
              ),
              TextButton(
              onPressed: () {
              navigateTo(const LoginView());
              },
              child: Text(
              "تسجيل الدخول",

            style:kTextStyle16,),
        )
        ],
      )


        ],
      ),
    ),

    )
    )
    ,
    );
  }
}
