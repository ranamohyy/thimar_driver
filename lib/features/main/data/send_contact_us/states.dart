part of 'bloc.dart';
class SendContactUsStates{}
class SendContactUsInitialState extends SendContactUsStates{}
class SendContactUsLoadingState extends SendContactUsStates{}
class SendContactUsSuccessState extends SendContactUsStates{
  final String msg;
  SendContactUsSuccessState({required this.msg,});
}
class  SendContactUsFailureState extends SendContactUsStates{
  final String errMessage;

  SendContactUsFailureState({required this.errMessage});
}