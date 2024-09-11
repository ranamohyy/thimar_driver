import 'package:driver/features/main/presentation/home_page/view.dart';
import 'package:driver/features/main/presentation/orders_page/view.dart';
import 'package:driver/features/main/presentation/notifications_page/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper_widgets/app_image.dart';
import '../account_main_page/view.dart';

class HomeNavView extends StatefulWidget {
  const HomeNavView({super.key});

  @override
  State<HomeNavView> createState() => _HomeNavViewState();
}

class _HomeNavViewState extends State<HomeNavView> {
  int currentPage=0;
  final tabs=<Widget>[
    const HomeView(),
     const MyOrdersView(),
    const NotificationScreen(),
    const MyAccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: tabs[currentPage],
      bottomNavigationBar:BottomNavigationBar(
        onTap: (index)  {
          setState(() {
            currentPage=index;
          });},
        backgroundColor:const Color(0xff4C8613),
        selectedItemColor:Colors.white,
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        type: BottomNavigationBarType.fixed,
        elevation: 20,
        items: [
          BottomNavigationBarItem(

              icon: AppImage(url:"Home.png",
                height: 21.h,
                width: 21.h,),
              label: "الرئيسية"
          ),
          BottomNavigationBarItem(
              backgroundColor:const Color(0xff4C8613),
              icon: AppImage(url:"طلباتي.png",
                height: 21.h,
                color: Colors.white,
                width: 21.h,),
              label: "طلباتي"

          )  ,
          const BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none_outlined, color: Colors.white,),
              label: "الاشعارات"

          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person,
              color: Colors.white,),
            label:
            "حسابي",
          ),




        ],
      ),
    );
  }
}
