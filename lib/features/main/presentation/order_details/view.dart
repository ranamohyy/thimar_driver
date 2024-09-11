import 'package:driver/features/helper_widgets/constans.dart';
import 'package:driver/features/helper_widgets/app_image.dart';
import 'package:driver/features/main/presentation/widgets/custom_profile_appBar.dart';
import 'package:driver/features/main/data/actionButtonsBloc/action_button_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import '../../../helper_widgets/app_loading.dart';
import '../widgets/CustomizeFlagButton.dart';
import '../widgets/customize_order_item.dart';

class OrderDetailsView extends StatefulWidget {
  const OrderDetailsView(
      {super.key,
      required this.type,
      required this.id,
      required this.location,
      required this.clientName,
      required this.date,
      required this.imageClient,
      required this.price,
      required this.statusNumber,
      required this.addressType,
      required this.addressDesc,
      required this.totalPrice,
      required this.deliveryPrice,
      required this.orderPrice,
      required this.payType});

  final String type;
  final int id;
  final String location;
  final String clientName;
  final DateTime date;
  final String imageClient;
  final String price;
  final String statusNumber;
  final String addressType;
  final String addressDesc;
  final String totalPrice;
  final String deliveryPrice;
  final String orderPrice;
  final String payType;

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  final action = GetIt.I<ActionButtonBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.type == 'الرئيسية'
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocConsumer<ActionButtonBloc, ActionButtonStates>(
                      bloc: action,
                      listener: (context, state) {
                        if (state is AcceptButtonLoading) {
                          const AppLoadingView();
                        } else if (state is AcceptButtonSuccess) {
                          Fluttertoast.showToast(msg: "تم قبول الطلب بنجاح");
                        } else if (state is AcceptButtonFailure) {
                          Fluttertoast.showToast(
                              msg: "حدث خطأ برجاء المحاوله لاجقا");
                        }
                      },
                      listenWhen: (previous, current) =>
                          current is AcceptButtonLoading ||
                          current is AcceptButtonSuccess ||
                          current is AcceptButtonFailure,
                      buildWhen: (previous, current) =>
                          current is AcceptButtonSuccess,
                      builder: (context, state) => SizedBox(
                            width: 180,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                action.add(AcceptOrderEvent(id: widget.id));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kPrimaryColor),
                              child:
                                  const Text("قبول", style: kTextStyle17white),
                            ),
                          )),
                  BlocConsumer<ActionButtonBloc, ActionButtonStates>(
                    bloc: action,
                    listener: (context, state) {
                      if (state is RefuseButtonLoading) {
                        const AppLoadingView();
                      } else if (state is RefuseButtonSuccess) {
                        Fluttertoast.showToast(msg: "تم رفض الطلب ");
                      } else if (state is RefuseButtonFailure) {
                        Fluttertoast.showToast(
                            msg: "حدث خطأ برجاء المحاوله لاجقا");
                      }
                    },
                    listenWhen: (previous, current) =>
                        current is RefuseButtonLoading ||
                        current is RefuseButtonSuccess ||
                        current is RefuseButtonFailure,
                    buildWhen: (previous, current) =>
                        current is RefuseButtonLoading ||
                        current is RefuseButtonSuccess ||
                        current is RefuseButtonFailure,
                    builder: (context, state) => SizedBox(
                      width: 180,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          action.add(RefuseOrderEvent(id: widget.id));
                          Fluttertoast.showToast(msg: 'تم رفض الطلب ');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text("رفض", style: kTextStyle17white),
                      ),
                    ),
                  )
                ],
              ),
            )
          : Bottom(
              typee: widget.type,
              id: widget.id,
              status: widget.statusNumber,
              totalPrice: widget.totalPrice,
            ),
      appBar: CustomAppBar(
        text: "طلب #${widget.id}",
        type: widget.type,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemBuilderForOrder(
              location: widget.location,
              clientName: widget.clientName,
              date: DateTime.parse("${widget.date}"),
              imageClient: widget.imageClient,
              price: widget.price,
              orderNumber: widget.id,
              statusOrder: widget.statusNumber,
            ),
            const Text(
              'عنوان التوصيل',
              style: kTextStyle20,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.addressType,
                      style: kTextStyle15normal,
                    ),
                    Text(
                      widget.addressDesc,
                      style: kTextStyle15light,
                    ),
                    // Text(state.model[index].address.),
                  ],
                ),
                Stack(alignment: Alignment.center, children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      AppImage(
                        url: "googleMap.png",
                        height: 80.h,
                        width: 80.w,
                      ),
                      AppImage(
                        url: "coverMap.png",
                        height: 80.h,
                        width: 80.w,
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.chevron_right_outlined,
                    color: Colors.white,
                    size: 25,
                  )
                ])
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Text("ملخص الطلب", style: kTextStyle20),
            const SizedBox(
              height: 12,
            ),
            Container(
              decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),

                  borderRadius: BorderRadius.all(Radius.circular(12.r))
              ),              height: 190.h,
              width: 440.w,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Row(children: [
                    const Text("إجمالي المنتجات", style: kTextStyle15normal),
                    const Spacer(),
                    Text(widget.totalPrice.toString(),
                        style: kTextStyle15normal)
                  ]),
                  const Divider(
                    thickness: 0.15,
                  ),
                  Row(children: [
                    const Text("سعر التوصيل", style: kTextStyle15normal),
                    const Spacer(),
                    Text(
                      widget.deliveryPrice.toString(),
                      style: kTextStyle15normal,
                    )
                  ]),
                  const Divider(
                    thickness: 0.15,
                  ),
                  Row(children: [
                    const Text("المجموع", style: kTextStyle15normal),
                    const Spacer(),
                    Text(widget.orderPrice.toString(),
                        style: kTextStyle15normal)
                  ]),
                  const Divider(
                    thickness: 0.15,
                  ),
                  SizedBox(height: 8.h,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("تم الدفع بواسطة${widget.payType}",
                          style: kTextStyle15normal),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

