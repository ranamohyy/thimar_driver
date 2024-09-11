part of 'bloc.dart';
abstract class ConfirmationCodeEvents{}
class SendCodeEvent extends ConfirmationCodeEvents{
  final String type;
  final String registerCode;
  final String PhoneNumber;
  SendCodeEvent({required this.type,
    required this.PhoneNumber , required  this.registerCode});

}