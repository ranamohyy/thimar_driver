part of 'bloc_bloc.dart';
class LogInStates{}

class LogInSucessState extends LogInStates {
  final String msg;


  LogInSucessState({required this.msg});
}
class LogInLoadingState extends LogInStates{}

class LogInFailedState extends LogInStates
{
  final String msg;
  LogInFailedState({required this.msg});
}

