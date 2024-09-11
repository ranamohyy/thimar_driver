part of 'bloc.dart';
class SuggestionsStates{}
class SuggestionsInitialState extends SuggestionsStates{}
class SuggestionsLoadingState extends SuggestionsStates{}
class SuggestionsSuccessState extends SuggestionsStates{
  final String msg;
  SuggestionsSuccessState({required this.msg,});
}
class  SuggestionsFailureState extends SuggestionsStates{
  final String errMessage;

  SuggestionsFailureState({required this.errMessage});
}