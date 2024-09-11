part of 'bloc.dart';

abstract class ProfileEvents{}





class EditProfileEvent extends ProfileEvents{
late  TextEditingController   nameController ;
late  TextEditingController phoneController;
late  TextEditingController cityController ;
late TextEditingController indentityNumber;
late File?  image ;
late TextEditingController carType;
late TextEditingController  iban;
late TextEditingController bankName;
late TextEditingController modelId;
final code='966';
late File? carLicenceImage,carFormImage,carInsuranceImage,carFrontImage,carBackImage;

EditProfileEvent(){
  indentityNumber = TextEditingController();
  iban =  TextEditingController();
  nameController = TextEditingController();
  phoneController = TextEditingController();
  cityController = TextEditingController();
  carType =  TextEditingController();
  bankName =  TextEditingController();
  modelId =  TextEditingController();
  carLicenceImage =null;
  carFormImage = null;
  carInsuranceImage = null;
  carFrontImage = null;
  carBackImage = null;
  image = null;
}

}



class EditPasswordEvent extends ProfileEvents{
final TextEditingController  passwordController = TextEditingController();
final TextEditingController    oldPasswordController= TextEditingController() ;
final  TextEditingController passwordConfirmationController = TextEditingController();
EditPasswordEvent();

}
