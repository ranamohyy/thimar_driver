part of 'bloc.dart';
 class FaqsStates{}

class FaqSuccessState extends FaqsStates{
   final String msg;
   final List<FaqsModel> list;
  FaqSuccessState({required this.msg,required this.list});
}


class FaqLoadingState extends FaqsStates{}
class FaqIntialState extends FaqsStates{}

class FaqFailedState extends FaqsStates{
   final String errMessage;

  FaqFailedState({required this.errMessage});

}

