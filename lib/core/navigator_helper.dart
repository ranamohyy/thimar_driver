import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void navigateTo(Widget page,{bool keepHistory=true}){

  Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!, MaterialPageRoute(builder: (context) => page,),
          (route) => keepHistory);
}
