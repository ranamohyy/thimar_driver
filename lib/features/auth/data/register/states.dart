part of 'bloc.dart';
class RegisterStates{}

class RegisterIntialState extends RegisterStates{}


class RegisterLoadingState extends RegisterStates{}


class RegisterSuccessState extends RegisterStates{

  final String msg;

  RegisterSuccessState({ required this.msg});
}


class RegisterFailureState extends RegisterStates{

  final String errMessage;

  RegisterFailureState({required this.errMessage});

}
