
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  ///personData
  static int? userId;
  static String? phoneNumber;
  static String?cityName;
  static String?userName;
  static String?image;
  static String?token;
  static String?identityNumber;
  static bool get isAuth=>token?.isNotEmpty==true;

  ///carData
  static String?bankName;
  static String?licenceImage;
  static String?frontCarImage;
  static String?insuranceCarImage;
  static String?formCarImage;
  static String?backCarImage;
  static String?carModelName;
  static int?carModelId;
  static int?iban;


  static late final SharedPreferences preferences;



///initializeData
  static init()async{
    preferences = await SharedPreferences.getInstance();
    userId= preferences.getInt('user_id');
    cityName = preferences.getString('city');
    userName = preferences.getString('user_name');
    token = preferences.getString('token');
    image = preferences.getString('image');
    phoneNumber = preferences.getString('phone');
    identityNumber = preferences.getString('identity_number');
    ///CarData
    iban = preferences.getInt('iban');
    backCarImage = preferences.getString('car_back_image');
    bankName = preferences.getString('bank_name');
    licenceImage = preferences.getString('car_licence_image');
    insuranceCarImage = preferences.getString('car_insurance_image');
    frontCarImage = preferences.getString('car_front_image');
    formCarImage = preferences.getString('car_form_image');
    carModelName = preferences.getString('car_model[name]');
    carModelId = preferences.getInt('car_model[id]');

  }
  ///saveData
static saveData(){

    if(userId!=null)preferences.setInt('user_id', userId!);
    if(userName!=null)preferences.setString('user_name',userName!);
    if(token !=null) preferences.setString('token', token !);
    if(image !=null) preferences.setString('image', image!);
    if(phoneNumber !=null) preferences.setString('phone', phoneNumber!);
    if(cityName !=null) preferences.setString('city', cityName!);
    if(identityNumber !=null) preferences.setString('identity_number', identityNumber!);

    if(iban !=null) preferences.setInt('iban', iban !);
    if(backCarImage !=null) preferences.setString('car_back_image', backCarImage !);
    if(bankName !=null) preferences.setString('bank_name', bankName !);
    if(licenceImage !=null) preferences.setString('car_licence_image', licenceImage !);
    if(insuranceCarImage !=null) preferences.setString('car_insurance_image', insuranceCarImage !);
    if(frontCarImage !=null) preferences.setString('car_front_image', frontCarImage !);
    if(formCarImage !=null) preferences.setString('car_form_image', formCarImage !);
    if(carModelName !=null) preferences.setString('car_model[name]', carModelName !);
    if(carModelId !=null) preferences.setInt('car_model[id]', carModelId !);



}
  static clear (){
    preferences.remove('user_id');
    preferences.remove('user_name');
    preferences.remove('token');
    preferences.remove('image');
    preferences.remove('phone');
    preferences.remove('city');
    preferences.remove('identity_number');

    preferences.remove('iban');
    preferences.remove('car_back_image');
    preferences.remove('bank_name');
    preferences.remove('car_licence_image');
    preferences.remove('car_insurance_image');
    preferences.remove('car_front_image');
    preferences.remove('car_form_image');
    preferences.remove('car_model[name]');
    preferences.remove('car_model[id]');

  }
  
  
}