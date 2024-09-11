import 'package:flutter/material.dart';

import '../../../helper_widgets/constans.dart';

class CardContactUs extends StatelessWidget {
  CardContactUs({super.key,required this.location,required this.email,required this.phone});
String location, phone, email;
  @override
  Widget build(BuildContext context) {
    return   Positioned(
      top: 150,

      child: Container(
        padding: const EdgeInsetsDirectional.all(20),
        height: 140,
        width: 330,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow()],
            borderRadius: BorderRadius.circular(26),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(children: [
              const Icon(
                Icons.location_on,
                color: kPrimaryColor,
              ),
              Text(location,
                  style: kTextStyle15black.copyWith(
                      fontWeight: FontWeight.w300))
            ]),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                const Icon(
                  Icons.phone_in_talk_outlined,
                  color: kPrimaryColor,
                ),
                Text(phone,
                    style: kTextStyle15black),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                const Icon(
                  Icons.email,
                  color: kPrimaryColor,
                ),
                Text(email,
                    style: kTextStyle15black.copyWith(
                        fontWeight: FontWeight.w300)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
