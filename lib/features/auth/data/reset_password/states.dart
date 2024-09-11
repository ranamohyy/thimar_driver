part of 'bloc.dart';
class ResetPasswordStates{}
class ResetPasswordLoadingState extends ResetPasswordStates{}
class ResetPasswordSuccessState  extends ResetPasswordStates{
  final String msg;

  ResetPasswordSuccessState({required this.msg});
}
class ResetPasswordFailureState extends ResetPasswordStates{
  final String errMessage;

  ResetPasswordFailureState({required this.errMessage});

}