import 'package:driver/features/main/presentation/home_nav/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../helper_widgets/constans.dart';
import '../../../../core/navigator_helper.dart';

   class CustomAppBar extends StatelessWidget  implements PreferredSizeWidget {
   const CustomAppBar({super.key, required this.text,this.type});
final String? type;
  final String text;

  @override
  Widget build(BuildContext context) {
    return
      AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
          text,
          style: kTextStyle18.copyWith(fontSize: 20.sp)

      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {type=='الرئيسية'?navigateTo(const HomeNavView()):
          Navigator.of(context).pop();
        },
        child:
         Stack(
          alignment: Alignment.center,
          children:  [
            Container(height: 50.h, width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color:kPrimaryColor.withOpacity(0.1)
              ),
            ),
            const Icon(FontAwesomeIcons.chevronRight, color: kPrimaryColor, size: 18,)

          ],
        ),
      ),


    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);


}
