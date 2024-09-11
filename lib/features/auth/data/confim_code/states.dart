part of 'bloc.dart';
class ConfirmCodeStates{}
class ConfirmCodeIntialState extends ConfirmCodeStates{}

class ConfirmCodeLoadingState extends ConfirmCodeStates{}

class ConfirmCodeSuccessState extends ConfirmCodeStates{
  final String msg;
  ConfirmCodeSuccessState({required this.msg});

}

class ConfirmCodeFailureState extends ConfirmCodeStates{
  final String errMessage;
  ConfirmCodeFailureState({required this.errMessage});
}