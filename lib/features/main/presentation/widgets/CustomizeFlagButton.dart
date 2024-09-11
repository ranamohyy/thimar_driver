import 'package:driver/core/navigator_helper.dart';
import 'package:driver/features/helper_widgets/app_loading.dart';
import 'package:driver/features/main/presentation/home_nav/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

import '../../../helper_widgets/constans.dart';
import '../../data/actionButtonsBloc/action_button_bloc.dart';
import '../orders_page/view.dart';

class Bottom extends StatefulWidget {
  Bottom({super.key, required this.typee, required this.id, required this.status, required this.totalPrice});

  final String typee;
  final int id;
  final String status;
  final String totalPrice;
  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int currentButton = 0;

  final _form =GlobalKey<FormState>();

  final deliveringBloc = GetIt.I<ActionButtonBloc>();
  TextEditingController? amount;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery=MediaQuery.of(context);

    return widget.typee == 'الحالية' ?
        widget.status=='accepted'?
           BlocConsumer<ActionButtonBloc, ActionButtonStates>(
                bloc: deliveringBloc,
                listener: (context, state) {
                  if (state is StartDeliverLoading) {
                    const AppLoadingView();
                  } else if (state is StartDeliverSuccess) {
                    Fluttertoast.showToast(msg: "يتم الآن توصيل الطلب");
                  } else if (state is StartDeliverFailure) {
                    Fluttertoast.showToast(msg: "حدث خطأ برداء المحاوله لاجقا");
                  }
                },
                listenWhen: (previous, current) =>
                    current is StartDeliverLoading ||
                    current is StartDeliverSuccess ||
                    current is StartDeliverFailure,
                builder: (context, state) =>
                     Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {deliveringBloc.add(StartDeliverEvent(id: widget.id));
                            changeButton();
                            },
                            child: const Text(
                              'بدء التوصيل',
                              style: kTextStyle15white,
                            ))
    )
                )
:
        BlocConsumer<ActionButtonBloc, ActionButtonStates>(

            bloc: deliveringBloc,
            listener: (context, state) {
              if (state is FinishOrderLoading) {
                const AppLoadingView();
              } else if (state is FinishOrderSuccess) {
                Fluttertoast.showToast(msg: "يتم الآن توصيل الطلب");
              } else if (state is FinishOrderFailure) {
                Fluttertoast.showToast(msg: "حدث خطأ برداء المحاوله لاجقا");
              }
            },
            listenWhen: (previous, current) =>
            current is FinishOrderLoading ||
                current is FinishOrderSuccess ||
                current is FinishOrderFailure,
            builder: (context, state) =>
                 Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {

                          showModalBottomSheet(context:context , builder:(context) =>
                          Container(
                            height: 260.h,
                            width: 450,
                            decoration:const  BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))

                            ),
                            child:
                            Form(
                              key:_form ,
                              child: Padding(
                                padding:const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                                child: Column(
                                  children: [
                                    const Text("المبلغ المستحق من العميل",style: kTextStyle16light,),
                                    Text(widget.totalPrice.toString(),style: kTextStyle20,),
                                    SizedBox(height: 4.h,),
                                    TextFormField(
                                      controller:amount,
                                      validator: (value) {
                                              if(value!.isEmpty){
                                            return 'يجب ادخال القيمة';
                                           }
                                         return null;
                                         },
                                      decoration:const InputDecoration(
                                        label: Text('اكتب المبلغ المستلم من العميل') ,
                                        hintStyle: kTextStyle15light
                                      ),
                                    ),

                                    SizedBox(height: 18.h,),

                                    ElevatedButton(onPressed: (){
                                      final valid= _form.currentState!.validate();
                                      if(valid){
                                        deliveringBloc.add(FinishOrderEvent(
                                            id: widget.id, amount: amount!.text));
                                        navigateTo(const HomeNavView());

                                      }
                                    }, child: const Text('تأكيد',style: kTextStyle15white,))
                                  ],
                                ),
                              ),
                            ),
                          )
                          );
                        },
                        child:const  Text(
                          'إنهاء الطلب',
                          style: kTextStyle15white,
                        ))))
        :
    const SizedBox();
  }
  changeButton(){
    BlocConsumer<ActionButtonBloc, ActionButtonStates>(

        bloc: deliveringBloc,
        listener: (context, state) {
          if (state is FinishOrderLoading) {
            const AppLoadingView();
          } else if (state is FinishOrderSuccess) {
            Fluttertoast.showToast(msg: "يتم الآن توصيل الطلب");
          } else if (state is FinishOrderFailure) {
            Fluttertoast.showToast(msg: "حدث خطأ برداء المحاوله لاجقا");
          }
        },
        listenWhen: (previous, current) =>
        current is FinishOrderLoading ||
            current is FinishOrderSuccess ||
            current is FinishOrderFailure,
        builder: (context, state) =>
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {

                      showModalBottomSheet(context:context , builder:(context) =>
                          Container(
                            height: 260.h,
                            width: 450,
                            decoration:const  BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))

                            ),
                            child:
                            Form(
                              key:_form ,
                              child: Padding(
                                padding:const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                                child: Column(
                                  children: [
                                    const Text("المبلغ المستحق من العميل",style: kTextStyle16light,),
                                    Text(widget.totalPrice.toString(),style: kTextStyle20,),
                                    SizedBox(height: 4.h,),
                                    TextFormField(
                                      controller:amount,
                                      validator: (value) {
                                        if(value!.isEmpty){
                                          return 'يجب ادخال القيمة';
                                        }
                                        return null;
                                      },
                                      decoration:const InputDecoration(
                                          label: Text('اكتب المبلغ المستلم من العميل') ,
                                          hintStyle: kTextStyle15light
                                      ),
                                    ),

                                    SizedBox(height: 18.h,),

                                    ElevatedButton(onPressed: (){
                                      final valid= _form.currentState!.validate();
                                      if(valid){
                                        deliveringBloc.add(FinishOrderEvent(
                                            id: widget.id, amount: amount!.text));
                                        navigateTo(const HomeNavView());

                                      }
                                    }, child: const Text('تأكيد',style: kTextStyle15white,))
                                  ],
                                ),
                              ),
                            ),
                          )
                      );
                    },
                    child:const  Text(
                      'إنهاء الطلب',
                      style: kTextStyle15white,
                    ))));

  }
}



