part of 'bloc.dart';
class ForgetPasswordEvents{}
class ForgetPasswordEvent extends ForgetPasswordEvents {
  final String phoneNumber;

  ForgetPasswordEvent({required this.phoneNumber});

}
