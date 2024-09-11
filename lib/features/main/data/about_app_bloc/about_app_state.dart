part of 'about_app_bloc.dart';

abstract class AboutAppStates {}

 class AboutAppInitialState extends AboutAppStates {}

 class AboutAppSuccessState extends AboutAppStates {
  final String msg;
  final AboutAppModel list;

  AboutAppSuccessState({required this.msg, required this.list});


 }

 class AboutAppFailedState extends AboutAppStates {

 final String errMessege;

  AboutAppFailedState({required this.errMessege});

 }

 class AboutAppLoadingState extends AboutAppStates {}
