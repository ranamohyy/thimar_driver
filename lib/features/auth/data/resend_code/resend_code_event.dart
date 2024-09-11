part of 'resend_code_bloc.dart';
 class ResendCodeEvents{}
 class ResendCodeEvent extends ResendCodeEvents {
   final String type;
   final TextEditingController phoneNumber;

   ResendCodeEvent( {required this.type,required this.phoneNumber


   });

 }
