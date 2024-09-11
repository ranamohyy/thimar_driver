import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import '../../../helper_widgets/constans.dart';
import '../../../../core/cache_helper.dart';
import '../../../../core/navigator_helper.dart';
import '../../../helper_widgets/app_image.dart';
import '../../../helper_widgets/app_input.dart';
import '../../../helper_widgets/app_loading.dart';
import '../../../main/presentation/home_nav/view.dart';
import '../../data/login/bloc_bloc.dart';
import '../forget_password/view.dart';
import '../register/view.dart';
import '../../../main/presentation/widgets/custom_top_auth.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String selectedCode = "966";
  final _form =GlobalKey<FormState>();
  final bloc = GetIt.I<LogInBloc>();
  final event = LogInEvent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(top: 80.h, start: 15.h, end: 15.h),
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomTopAuth(
                text1: "مرحبا بك مرة أخرى",
                text2: "يمكنك تسجيل الدخول الأن",
              ),
              AppInputView(
                isPhone: true,
                controller: event.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "password must be not empty";
                  } else if (value.length < 7) {
                    return "password must ba more than 7";
                  }
                  else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormField(
                controller: event.password,
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
                  hintText:"كلمة المرور" ,
                    hintStyle: kTextStyle15light,
              ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  navigateTo(const ForgetPasswordView());
                },
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    "نسيت كلمة المرور ؟",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xff707070),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              BlocConsumer<LogInBloc, LogInStates>(
                bloc: bloc,
                listener: (context, state) {
               if (state is LogInSucessState){
                 Fluttertoast.showToast(backgroundColor: Colors.amber,
                     msg: "تم تسجيل الدخول بنجاح");
                 navigateTo(const HomeNavView(),keepHistory: false);
               }else if(state is LogInFailedState){
                 Fluttertoast.showToast(backgroundColor: Colors.red,
                     msg:  "بيانات الاعتماد هذه غير متطابقة مع البيانات المسجلة لدينا.");
               }
                },
                builder: (context, state) {
                 if (State is LogInLoadingState){
                   return const AppLoadingView();}
                  return ElevatedButton(
                    onPressed: () {
                      final valid=_form.currentState!.validate();
                      if (valid){
                      bloc.add(
                      event);
                      }


                      },
                    style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                    child: Text(
                      " تسجيل الدخول",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: kTextFamily,
                      ),
                    ),);

                 }

              ),
              SizedBox(
                height: 45.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      "ليس لديك حساب ؟",
                      style: kTextStyle15
                  ),
                  GestureDetector(
                    onTap: () {
                        navigateTo( RegisterView());

                    },
                    child:  Text(
                        "تسجيل الأن",
                        style: kTextStyle16
                    ),
                  ),
                ],
              )


            ],),),
      ),

    );
  }
}


