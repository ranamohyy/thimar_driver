import 'package:driver/features/helper_widgets/constans.dart';
import 'package:driver/core/cache_helper.dart';
import 'package:driver/features/main/presentation/widgets/car_model.dart';
import 'package:driver/features/main/presentation/widgets/user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import '../../../helper_widgets/app_image.dart';
import '../../../helper_widgets/app_loading.dart';
import '../../../helper_widgets/pickImage.dart';
import '../../data/my_profile/bloc.dart';
class MyProfileView extends StatefulWidget {
  const MyProfileView({super.key});
  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  final event= EditProfileEvent();
  final _form =GlobalKey<FormState>();
  final bloc= GetIt.I<MyProfileBloc>();
  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(
      length: 2,
      child: Scaffold(

      appBar:
      PreferredSize(
        preferredSize:const  Size.fromHeight(250),
        child: AppBar(
          backgroundColor: Colors.white,
          title:   Text(
            'البيانات الشخصية',
            style: kTextStyle18.copyWith(fontSize: 20.sp)
            ,
          ),
          centerTitle: true,
        
          leading:  GestureDetector(
            onTap: (){Navigator.of(context).pop();},
            child: Stack(
              alignment: Alignment.center,
              children:  [
                Container(height: 50.h, width: 40.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color:kPrimaryColor.withOpacity(0.1)
                  ),
                ),
            const Icon(FontAwesomeIcons.chevronRight, color: kPrimaryColor, size: 18,)
        
              ],
            ),
          ),
          bottom: PreferredSize(preferredSize: Size.fromHeight(200.h), child:
                 Column(
               children: [
                 SizedBox(height: 8.h,),
                 Center(
                  child: GestureDetector(
                       onTap: () {
                         pickImage();
                                },
                               child:
                                  Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 108.h,
                width: 105.w,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(
                          25.r)),
                  child:
                  event.image != null ?
                  Image.file(event.image!,) :
                  AppImage(url: CacheHelper.image.toString(),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
        
                ),
              ),
        
               Positioned(
                  child: AppImage(url: 'pick_photo.png',
                    color: Colors.white,
                    height: 38.h,
                    width: 38.w,)
              )
            ]),
            ),
          ),
             SizedBox(height: 12.h),
            Text(
        CacheHelper.userName.toString(),
        style: kTextStyle16,
            ),
                 Text(
                   CacheHelper.phoneNumber.toString(),
                   style: kTextStyle16light,
                 ),
             TabBar(
          unselectedLabelColor: const Color(0xffA2A1A4),
          indicator:  const BoxDecoration(color: kPrimaryColor ,
              borderRadius: BorderRadius.all(Radius.circular(16))
          ),
          automaticIndicatorColorAdjustment: true,
          indicatorColor: kPrimaryColor,
        
          labelColor: Colors.white,
          tabs: [
            Tab(child:
            SizedBox(
        
              width: 180.w,
              child:
              const Center(child: Text("البيانات الشخصية",style: TextStyle(
                  fontFamily: kTextFamily
              ),
              ) ,) ,)),
            Tab(child:
            SizedBox(
              width: 180.w,
              child:
              const Center(child: Text("بيانات السيارة"
                ,style:  TextStyle(
                    fontFamily: kTextFamily
                ),)
                ,),),)
        
          ]),],
        )),
        ),
      ),
      body:Form(
        key: _form,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.h),
          child: Column(
            children: [
              SizedBox(
                height:MediaQuery.of(context).size.height*0.6.h,
                child: TabBarView(children: [

                  const  UserDataModel(),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CarModelView(
                            modelId: event.modelId,
                            iban: event.iban,
                            bankName: event.bankName,
                            carLicenceImage: event.carLicenceImage,
                            carType: event.carType,
                            carInsuranceImage: event.carInsuranceImage,
                            carFrontImage: event.carFrontImage,
                            carFormImage: event.carFormImage,
                            carBackImage: event.carBackImage
                            ,

                          ),

                        ],
                      ),
                    ),
                  )
                ]),
              ),
              BlocConsumer<MyProfileBloc,ProfileStates>(bloc: bloc,
                  listener: (context, state) {
                    if(state is EditProfileSuccessState){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.msg)));
                    }if(state is EditProfileFailureState){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));
                    }
                  },
                  builder:(context, state) {
                    if (state is EditProfileLoadingState) {
                      return const AppLoadingView();
                    }
                    return ElevatedButton(onPressed: () {
                      final valid = _form.currentState!.validate();
                      if (valid){
                        bloc.add(event);
                      }
                    },
                        child: const Text(
                          "تعديل البيانات", style: TextStyle(color: Colors
                            .white),));

                  } ),

            ],
          ),
        ),
      ),
      )
    );
  }
}
