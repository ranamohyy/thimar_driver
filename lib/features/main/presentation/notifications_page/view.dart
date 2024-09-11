import 'package:driver/features/helper_widgets/constans.dart';
import 'package:driver/core/navigator_helper.dart';
import 'package:driver/features/helper_widgets/app_image.dart';
import 'package:driver/features/helper_widgets/app_loading.dart';
import 'package:driver/features/main/presentation/widgets/custom_profile_appBar.dart';
import 'package:driver/features/main/presentation/home_nav/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import '../../data/notifications_bloc/notifications_bloc.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final bloc=GetIt.I<NotificationsBloc>()..add(NotificationsEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CustomAppBar(text:'الإشعارات' ),

      body: BlocBuilder<NotificationsBloc,NotificationsStates>(
        bloc: bloc,
        buildWhen: (previous, current) => current is AllNotificationsLoading||current is AllNotificationsSuccess||current is AllNotificationsFailure,
       builder :(context, state) {
         if (state is AllNotificationsLoading) {
           return const AppLoadingView();
         }
         if (state is AllNotificationsSuccess) {
    if (state.model.data.notifications.isEmpty) {
    return Center(
    child: Image.network(
    "https://img.freepik.com/free-vector/hand-drawn-no-data-concept_52683-127823.jpg?w=900&t=st=1725622423~exp=1725623023~hmac=646e5e6039928294509922e9c8f688e49128875c02f2c93460bd590afb643abd"
    )
    );}
           else{return ListView.builder(
             itemCount: state.model.data.notifications.length,
             padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
             itemBuilder: (context, index) =>
                 GestureDetector(
                   onTap: (){navigateTo(const HomeNavView());},
                   child: Padding(
                     padding:  EdgeInsets.only(bottom: 22.h),
                     child: NotificationCard(
                       title: state.model.data.notifications[index].title,
                       message: state.model.data.notifications[index].body,
                       timeAgo: state.model.data.notifications[index].createdAt,
                       icon: "notification.png",

                     ),
                   ),
                 ),

           );
         }}
       return const SizedBox();})
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String timeAgo;
  final String icon;

  const NotificationCard({super.key,
    required this.title,
    required this.message,
    required this.timeAgo,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0.3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side:  BorderSide(
          color: Colors.white, // Border color for the selected card
          width: 1.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:  EdgeInsets.all(12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: AppImage(
              url: icon,
              height: 50.h,
              width: 40.w,
            ),
          ),
            SizedBox(width: 8.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: kTextStyle15.copyWith(fontWeight: FontWeight.bold)
                ),
                 SizedBox(height: 8.h),
                Text(
                  message,
                  style:kTextStyle15light
                ),
                 SizedBox(height: 8.h),
                Text(
                  timeAgo,
                  style: kTextStyle15black
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
//          NotificationCard(
//             title: 'رسالة إدارية',
//             message:
//             'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة. لقد تم توليد هذا النص من مواد النص العربي',
//             timeAgo: 'منذ ساعتين',
//             icon: "logo.png",
//
//           ),