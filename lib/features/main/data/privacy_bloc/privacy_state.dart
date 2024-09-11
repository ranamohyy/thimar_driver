part of 'privacy_bloc.dart';

@immutable
sealed class PrivacyStates {}

final class PrivacyInitial extends PrivacyStates {}
final class PrivacyLoading extends PrivacyStates {}
final class PrivacySuccess extends PrivacyStates {
  final PrivacyModel list;
  final String msg;
  PrivacySuccess( {required this.msg,required this.list,});}

final class PrivacyFailure extends PrivacyStates {
  final String msg;

  PrivacyFailure({required this.msg});
}
