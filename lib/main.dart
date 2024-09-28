import 'package:driver/core/cache_helper.dart';
import 'package:driver/core/get_it.dart';
import 'package:driver/features/auth/presentation/login/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/helper_widgets/constans.dart';
import 'core/dio_helper.dart';
import 'core/navigator_helper.dart';
import 'firebase_options.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  initGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  CacheHelper.init();
  DioHelper.interceptors();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations', // <-- change the path of the translation files
      fallbackLocale: const Locale('ar'),
      startLocale:const  Locale('ar') ,
      child:  MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375,812 ),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child) => MaterialApp(
               localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
               locale: context.locale,
              debugShowCheckedModeBanner: false,
              title: 'thimar-driver',
              navigatorKey:navigatorKey,
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                fontFamily: kTextFamily ,
                elevatedButtonTheme: ElevatedButtonThemeData(

                    style:
                    ElevatedButton.styleFrom(
                        fixedSize: Size.fromHeight(55.h),
                        padding:const EdgeInsets.symmetric(horizontal: 12),
                        backgroundColor: kPrimaryColor,
                        maximumSize: MediaQuery.of(context).size,

                        shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(16.r))

                    )
                ),
                colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor,primary: kPrimaryColor ),
                inputDecorationTheme: InputDecorationTheme(

                    alignLabelWithHint: true,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(22.r)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22.r),
                        borderSide: const BorderSide(color: Color(0xffF3F3F3)))
                ),),

              home: child,
            ),

        child:const  LoginView()
    );
  }
}


