part of 'bloc.dart';
class RegisterEvents{}

class RegisterEvent extends RegisterEvents{
  late TextEditingController phoneNumber;
      late TextEditingController   city;
      late TextEditingController indentityNumber;
      late TextEditingController email;
  late TextEditingController password;
  late TextEditingController passwordConfirmation;
  late TextEditingController carType;
  late TextEditingController  iban;
  late TextEditingController bankName;
  late TextEditingController modelId;
  final code='966';
  late TextEditingController fullName;

 late int ? cityId,lat ,lng;
   String? location;
  late File? carLicenceImage,carFormImage,carInsuranceImage,carFrontImage,carBackImage;

  RegisterEvent()
      {
        indentityNumber = TextEditingController();
        iban =  TextEditingController();
        email =  TextEditingController();
        carType =  TextEditingController();
        bankName =  TextEditingController();
        passwordConfirmation =  TextEditingController();
        fullName =  TextEditingController();
    phoneNumber =  TextEditingController();
        city =  TextEditingController();
    password =  TextEditingController();
    modelId =  TextEditingController();
        carLicenceImage =null;
        carFormImage = null;
        carInsuranceImage = null;
        carFrontImage = null;
        carBackImage = null;

      }


}