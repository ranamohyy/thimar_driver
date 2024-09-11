import 'package:driver/features/auth/data/forget_password/bloc.dart';
import 'package:driver/features/auth/data/login/bloc_bloc.dart';
import 'package:driver/features/auth/data/resend_code/resend_code_bloc.dart';
import 'package:get_it/get_it.dart';
import '../features/auth/data/confim_code/bloc.dart';
import '../features/auth/data/register/bloc.dart';
import '../features/auth/data/reset_password/bloc.dart';
import '../features/main/data/about_app_bloc/about_app_bloc.dart';
import '../features/main/data/actionButtonsBloc/action_button_bloc.dart';
import '../features/main/data/faqs/bloc.dart';
import '../features/main/data/get_contact/get_contact_bloc.dart';
import '../features/main/data/homePageBloc/home_page_bloc.dart';
import '../features/main/data/my_profile/bloc.dart';
import '../features/main/data/notifications_bloc/notifications_bloc.dart';
import '../features/main/data/ordes_bloc/orders_bloc.dart';
import '../features/main/data/privacy_bloc/privacy_bloc.dart';
import '../features/main/data/send_contact_us/bloc.dart';
import '../features/main/data/suggestions/bloc.dart';

void initGetIt(){
  final getIt= GetIt.instance;
getIt.registerFactory(()=>LogInBloc());
getIt.registerFactory(()=>ForgetPasswordBloc());
getIt.registerFactory(()=>ResendCodeBloc());
getIt.registerFactory(()=>ConfirmCodeBloc());
getIt.registerFactory(()=>RegisterBloc());
getIt.registerFactory(()=>ResetPasswordBloc());
getIt.registerFactory(()=>MyProfileBloc());
getIt.registerFactory(()=>FaqsBloc());
getIt.registerFactory(()=>AboutAppBloc());
getIt.registerFactory(()=>GetContactBloc());
getIt.registerFactory(()=>PrivacyBloc());
getIt.registerFactory(()=>ActionButtonBloc());
getIt.registerFactory(()=>SendContactUsBloc());
getIt.registerFactory(()=>SuggestionsBloc());
getIt.registerFactory(()=>OrdersBloc());
getIt.registerFactory(()=>NotificationsBloc());
getIt.registerFactory(()=>HomePageBloc());




}