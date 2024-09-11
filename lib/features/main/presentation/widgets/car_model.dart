import 'dart:io';
import 'package:driver/core/cache_helper.dart';
import 'package:driver/features/helper_widgets/app_image.dart';
import 'package:driver/features/helper_widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import '../../../helper_widgets/constans.dart';
import '../../../auth/data/register/bloc.dart';
class CarModelView extends StatefulWidget {
   CarModelView(
   {
     this.carLicenceImage,this.carFormImage,this.carFrontImage,this.carInsuranceImage,this.carBackImage,
     super.key, required this.carType, required this.modelId, required this.iban, required this.bankName}
       );
 final TextEditingController carType;
 final TextEditingController modelId;
 final TextEditingController iban;
 final TextEditingController bankName;
 File? carBackImage,carFrontImage,carInsuranceImage,carFormImage,carLicenceImage;
  @override
  State<CarModelView> createState() => _BodyDriverDetailsState();
}

class _BodyDriverDetailsState extends State<CarModelView> {

   final bloc= GetIt.I<RegisterBloc>();

  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: (){pickImage();},
                  child:
                const   AppImage(url: 'licence.png',height: 100,width: 100,)
              )
             , GestureDetector(
                  onTap: (){pickImage();},
                  child:
                  const  AppImage(url: 'form.png',height: 100,width: 100,)),


              GestureDetector(
                  onTap: (){pickImage();},
                  child:
                  const  AppImage(
                    url: 'security.png',height: 100,width: 100,)
              )

            ],

          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               GestureDetector(
                   onTap: (){pickImage();},
                   child:
                   const AppImage(url:'front.png',height: 100,width: 100,)

               ),
               GestureDetector(
                   onTap: (){pickImage();},
                   child:
                   const AppImage(url:'back.png',height: 100,width: 100,)


               ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          AppInputView(isPhone: false,
          controller: widget.carType,
          validator: (value){
            if(value!.isEmpty){
              return'نوع السياره مطلوب';
            }
            return null;
          },
            decoration: const InputDecoration(
              hintStyle:kTextStyle15light,
              hintText:
              '   نوع السيارة  ',

              prefixIcon:SizedBox(child:  AppImage(url: 'car.png',fit: BoxFit.scaleDown,height: 0,width: 0,)),),
          ),
          SizedBox(
            height: 16.h,
          ),
          AppInputView(isPhone: false,
      controller: widget.modelId,
      validator: (value){
      if(value!.isEmpty){
      return'     موديل السياره مطلوب';
      }
      return null;},
            decoration: const  InputDecoration(
              hintStyle:kTextStyle15light,
      hintText:
                '   موديل السيارة  '

              ,
            prefixIcon:const SizedBox(child:  AppImage(url: 'car.png',fit: BoxFit.scaleDown,height: 0,width: 0,)),),
          ),
          SizedBox(
            height: 16.h,
          ),
          AppInputView(
            controller: widget.iban,
            validator: (value){
              if(value!.isEmpty){
                return' رقم الإيبان مطلوب';
              }
              return null;},
            isPhone: false,
            decoration: const InputDecoration(
            hintStyle:kTextStyle15light,
              hintText:
              '  رقم الإيبان  ',
            prefixIcon:AppImage(url: 'save-money.png',height: 24,width: 28,),),
          ),
          SizedBox(
            height: 16.h,
          ),
          AppInputView(
            controller: widget.bankName,
            validator: (value){
              if(value!.isEmpty){
                return' اسم البنك مطلوب';
              }
              return null;},
            isPhone: false,
      decoration:const InputDecoration(
        hintStyle:kTextStyle15light,
        hintText:
        '  اسم البنك  ',
            prefixIcon:  SizedBox(
                child: AppImage(url: 'bank-building.png',height: 0,width: 0,fit: BoxFit.scaleDown,)),)
          ),


        ],



    );

  }
   Future<XFile?> pickImage()async{
     final ImagePicker imagePicker = ImagePicker();

     final returnedImage=   await imagePicker.pickImage(source:ImageSource.gallery);
     setState(() {
       // selectedImage= File(returnedImage!.path);
       widget.carBackImage= File(returnedImage!.path);
       widget.carFrontImage= File(returnedImage!.path);
       widget.carInsuranceImage= File(returnedImage!.path);
       widget.carFormImage= File(returnedImage!.path);
       widget.carLicenceImage= File(returnedImage!.path);

     });
     return null;

   }

}
