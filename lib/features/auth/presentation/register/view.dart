import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import '../../../helper_widgets/constans.dart';
import '../../../../core/navigator_helper.dart';
import '../../../helper_widgets/app_loading.dart';
import '../../data/register/bloc.dart';
import '../confirm_code/view.dart';
import '../../../main/presentation/widgets/custom_top_auth.dart';
import '../../../main/presentation/widgets/body_register_user_details.dart';
import '../../../main/presentation/widgets/car_model.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  int index =0;



  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
   void Function()? onPressed;
   final bloc= GetIt.I<RegisterBloc>();
   final event = RegisterEvent();
  final _form= GlobalKey<FormState>();
   late  List<Widget> body = [
    BodyRegisterUserDetails(
      email: event.email,
      cityController: event.city,
      indentityNumber: event.indentityNumber,
      password: event.password,
      passwordConfirmation: event.passwordConfirmation,
       phoneNumber: event.phoneNumber,
      nameController: event.fullName,
    ),
     CarModelView(
       bankName: event.bankName,
       carType: event.carType,
       iban: event.iban,
       modelId: event.modelId,
         carBackImage: event.carBackImage,
       carFormImage: event.carFormImage,
       carFrontImage: event.carFrontImage,
       carInsuranceImage: event.carInsuranceImage,
       carLicenceImage: event.carLicenceImage,

     ),
  ];


  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
          body:SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key:_form ,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    const CustomTopAuth(
                        text1: "مرحبا بك مرة أخرى",
                        text2: "يمكنك تسجيل حساب جديد الأن"),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      width: 230,
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Expanded(
                            child: SizedBox(
                              child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.min,

                                        children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: widget.index==0? kPrimaryColor:Colors.grey,
                                              borderRadius: BorderRadius.circular(10)

                                          ),
                                          height: 29,
                                          width: 29,
                                          child: Center(child: Text('1',style: kTextStyle15white,)),
                                        ),
                                        Text("  البيانات الشخصية  ",style: kTextStyle15,),
                                      ],),
                            ),
                          ),
                             DottedDashedLine(
                                axis: Axis.horizontal,
                                height: 40.h,
                                width: 80.w,
                               dashColor: widget.index==0? Colors.grey:kPrimaryColor
                              ),
                          Expanded(
                            child: SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,

                                mainAxisSize: MainAxisSize.min,

                                        children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color:  widget.index==1? kPrimaryColor:Colors.grey,
                                              borderRadius: BorderRadius.circular(10.r)

                                          ),
                                          height: 29.h,
                                          width: 29.w,
                                          child: const Center(child: Text('2',style: kTextStyle15white,)),
                                        ),
                                     const   Text("   بيانات\n السيارة",style: kTextStyle15,),
                                      ],),
                            ),
                          ),
                                ],
                              ),
                      ),
                    )  ,
                    SizedBox(
                      height: 12.h,
                    ),
                    body[widget.index],
                    widget.index==0?
                    ElevatedButton(onPressed: (){
                      if(widget.index>=1){
                        return;
                      }else{
                final valid=  _form.currentState!.validate() ;
               if (valid) {
                      setState(() {widget.index = widget.index + 1;});
                           }}},
                child:const  Text('التالي',style: kTextStyle15white),):
                    BlocConsumer(
                        bloc: bloc,
                        listener: (context, state) {
                          if (state is RegisterSuccessState){
                            Fluttertoast.showToast(
                                msg:"تم التسجيل بنجاح  رجاء تفعيل حسابك ",
                                fontSize: 15.sp,
                                backgroundColor: Colors.black,
                                textColor: Colors.white);
                            navigateTo(
                                ConfirmCodeView(
                                    type: 'driver_register',
                                    phone:event.phoneNumber)
                            );
                          }
                          if (state is RegisterFailureState){
                            Fluttertoast.showToast
                              (msg: "قيمة حقل الهاتف مُستخدمة من قبل.",
                                fontSize: 15.sp,backgroundColor: Colors.black,
                                textColor: Colors.white



                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is RegisterLoadingState){
                            return const AppLoadingView();
                          }
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusDirectional.circular(16.r),

                                )),
                            onPressed: () {
                              final valid=  _form.currentState!.validate() ;
                              if (valid) {
                                bloc.add(
                                  event );
                              }
                            },

                            child:  Text(
                              "تسجيل",
                              style: kTextStyle16.copyWith(color: Colors.white),
                            ),


                          );

                        }
                    ),


                  ]   ),
              )
     ) )
    );
  }
}
