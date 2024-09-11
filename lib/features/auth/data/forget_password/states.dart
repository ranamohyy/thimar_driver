part of 'bloc.dart';
class ForgetPasswordStates{}

class ForgetPasswordSucessState extends ForgetPasswordStates {
  final String msg;


  ForgetPasswordSucessState({required this.msg});
}
class ForgetPasswordLoadingState extends ForgetPasswordStates{}

class ForgetPasswordFailedState extends ForgetPasswordStates
{
  final String msg;
  ForgetPasswordFailedState({required this.msg});
}

