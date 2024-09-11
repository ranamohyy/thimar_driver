part of 'action_button_bloc.dart';

 class ActionButtonEvents {}
class RefuseOrderEvent extends ActionButtonEvents{
   final  int id;
    RefuseOrderEvent({required this.id});
}
class AcceptOrderEvent extends ActionButtonEvents{
  final int id;
   AcceptOrderEvent({required this.id});

}


class StartDeliverEvent extends ActionButtonEvents{
  final int id;
  StartDeliverEvent({required this.id});

}
class FinishOrderEvent extends ActionButtonEvents{
  final int id;
  final String amount;
  FinishOrderEvent({
    required this.id,required this.amount
  });


}
