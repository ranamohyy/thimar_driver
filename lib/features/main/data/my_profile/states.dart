part of 'bloc.dart';
class ProfileStates{}
///editProfile
class EditProfileLoadingState extends ProfileStates{}
class EditProfileInitialState extends ProfileStates{}
class EditProfileSuccessState extends ProfileStates{
  final String msg;
  EditProfileSuccessState({required this.msg,});
}
class  EditProfileFailureState extends ProfileStates{
  final String errMessage;

  EditProfileFailureState({required this.errMessage});
}




///editPassword
class EditPasswordInitialState extends ProfileStates{}
class EditPasswordLoadingState extends ProfileStates{}
class EditPasswordSuccessState extends ProfileStates{
  final String msg;
  EditPasswordSuccessState({required this.msg,});
}
class  EditPasswordFailureState extends ProfileStates{
  final String errMessage;

  EditPasswordFailureState({required this.errMessage});
}