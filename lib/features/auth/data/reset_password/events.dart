part of 'bloc.dart';
class ResetPasswordEvents{}
class ResetPasswordEvent extends ResetPasswordEvents{

  final phone,Code;
  final String password;


  ResetPasswordEvent({
    required this.phone,
    required this.password
    ,required this.Code});


}