part of 'get_contact_bloc.dart';

 class GetContactStates {}

final class GetContactInitial extends GetContactStates {}
final class GetContactLoading extends GetContactStates {}
final class GetContactSuccess extends GetContactStates {
  final String msg;
  final ContactUsModel list;
  GetContactSuccess({required this.msg,required this.list});

}
final class GetContactFailure extends GetContactStates {
  final String errMessage;
  GetContactFailure({required this.errMessage});
}
