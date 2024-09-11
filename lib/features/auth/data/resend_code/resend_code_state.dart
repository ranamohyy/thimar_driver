part of 'resend_code_bloc.dart';

class ResendCodeStates{}
class ResendCodeIntialState extends ResendCodeStates{}

class ResendCodeLoadingState extends ResendCodeStates{}

class ResendCodeSuccessState extends ResendCodeStates{
  final String msg;
  ResendCodeSuccessState({required this.msg});

}

class ResendCodeFailureState extends ResendCodeStates{
  final String errMessage;
  ResendCodeFailureState({required this.errMessage});
}