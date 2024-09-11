import 'package:driver/core/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helper_widgets/constans.dart';
import '../../../../core/navigator_helper.dart';
import '../../../auth/presentation/login/view.dart';
import '../../../helper_widgets/app_image.dart';
import '../about_app/view.dart';
import '../contact us/view.dart';
import '../faqs/view.dart';
import '../home_nav/view.dart';
import '../my_profile/view.dart';
import '../privacy/view.dart';
import '../suggestions/view.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  List tabs = [
    const MyProfileView(),
    const AboutAppView(),
    const FAQSView(),
    const PrivacyView(),
    const ContactUsView(),
    const SuggestionsView(),
  ];
  List<Map<String, String>> item = [
    {"icon": "User.png", "title": "البيانات الشخصية"},
    {"icon": "info.png", "title": "عن التطبيق"},
    {"icon": "question.png", "title": "أسئلة متكررة"},
    {"icon": "privacy.png", "title": "سياسة الخصوصية"},
    {"icon": "calling.png", "title": "تواصل معنا"},
    {"icon": "edit_pen .png", "title": "الشكاوي والأقتراحات"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(260.h),
          child: Stack(alignment: Alignment.centerLeft, children: [
            Container(
                height: 260,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius:  BorderRadius.only(
                        bottomLeft: Radius.circular(50.r),
                        bottomRight: Radius.circular(50.r))),
                child: Column(
                  children: [
                     SizedBox(
                      height: 50.h,
                    ),
                    const Text("حسابي", style: kTextStyle20),
                     SizedBox(
                      height: 23.h,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.network(
                        CacheHelper.image.toString(),
                        height: 90.h,
                        width: 80.w,
                        fit: BoxFit.fill,
                      ),
                    ),

                    Text(CacheHelper.userName.toString(), style: kTextStyle15white),
                     SizedBox(
                      height: 4.h,
                    ),
                    Text(CacheHelper.phoneNumber.toString(),
                        style:
                            kTextStyle15light.copyWith(color: Colors.black38)),
                  ],
                )),
             AppImage(
              url: "circuts.png",
              height: 300.h,
              width: 400.w,
              fit: BoxFit.fill,
            )
          ]),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(
                  height: 10.h,
                ),
                GridView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: item.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 250 / 35,
                    ),
                    itemBuilder: (context, index) => ListTile(
                          onTap: () {
                            navigateTo(tabs[index]);
                          },
                          title: Text("${item.elementAt(index)['title']}",
                              style: kTextStyle17),
                          trailing: const AppImage(
                              url: "go_icon.png", height: 30, width: 30),
                          leading: AppImage(
                              url: "${item.elementAt(index)['icon']}",
                              height: 29.h,
                              width: 27.w,
                              color: kPrimaryColor),
                        )),
                GestureDetector(
                  onTap: () {
                    navigateTo(const LoginView());
                  },
                  child: const ListTile(
                      trailing:
                          AppImage(url: "Turn off.png", height: 26, width: 26),
                      title: Text(
                        "تسجيل الخروج",
                        style: kTextStyle17,
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
