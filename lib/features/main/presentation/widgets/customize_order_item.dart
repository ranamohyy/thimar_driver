import 'package:cached_network_image/cached_network_image.dart';
import 'package:driver/features/helper_widgets/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/navigator_helper.dart';
import '../../../helper_widgets/app_image.dart';
import '../order_details/view.dart';
class ItemBuilderForOrder extends StatelessWidget {
  const ItemBuilderForOrder({super.key, required this.orderNumber, required this.date, required this.imageClient, required this.clientName, required this.price, required this.statusOrder, required this.location});
final int orderNumber;
final DateTime? date;
final String imageClient;
final String clientName;
final String price;
final String statusOrder;
final String location;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
            SizedBox(
              child: Column(
                children: [
                   SizedBox(height: 16.h,),
                  Row(children: [
                     Text("طلب #$orderNumber",

                      style:kTextStyle20),
                    const Spacer(),
                    Container(height: 25.h,width: 90.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: kPrimaryColor.withOpacity(0.1),
                        
                      ),
                       child:
                    Center(
                      child: Text(statusOrder,
                        style: kTextStyle15),
                    )),
                  ] ),
                   Align(
                    alignment: Alignment.centerRight,
                    child: Text(

                       " ${date?.toLocal().toString().split(' ')[0]}",
                      style:kTextStyle15light),
                  ),
                   Divider(thickness: 0.1.r,),
                   Row(
                     children: [
                       SizedBox(
                       width: 50.w,height: 40.h,
                         child: CachedNetworkImage(imageUrl: imageClient,),

                       ),SizedBox(width: 12.w,)
                       ,Column(children: [
                         Text(clientName,style: kTextStyle15,),
                         SizedBox(height: 5.h,),
                         Row(
                           children: [
                             Icon(Icons.location_on_outlined,
                             size: 20.r,color: Colors.grey,
                             ),
                             Text(location,style: kTextStyle15light,),
                           ],
                         )
                       ],)
                     ],
                   ),
                  const Divider(thickness: 0.16,),
                  Row(
                    children: [
                       AppImage(url:"orders.png",height: 50.h,width: 120.w,fit: BoxFit.fill,),
                      const Spacer(),
                       Text(price,
                          style:kTextStyle16
                       )

                    ],
                  )



                ],
              ),
            ),

        ] );

  }
}
