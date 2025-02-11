import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:housemanuser/controller/booking/booking_cubit.dart';
import 'package:housemanuser/controller/chat/chat_cubit.dart';
import 'package:housemanuser/controller/houseman/houseman_cubit.dart';
import 'package:housemanuser/controller/localization/localization_cubit.dart';
import 'package:housemanuser/controller/login/login_cubit.dart';
import 'package:housemanuser/controller/notification/notification_cubit.dart';
import 'package:housemanuser/controller/profile/profile_cubit.dart';
import 'package:housemanuser/controller/provider/provider_cubit.dart';
import 'package:housemanuser/controller/rating.dart';
import 'package:housemanuser/controller/registration/registration_cubit.dart';
import 'package:housemanuser/controller/remember_me/remember_cubit.dart';
import 'package:housemanuser/controller/reset_password/reset_cubit.dart';
import 'package:housemanuser/controller/reviews/review_cubit.dart';
import 'package:housemanuser/controller/search/search_cubit.dart';
import 'package:housemanuser/controller/search_chat/search_chat_cubit.dart';
import 'package:housemanuser/controller/services/services_cubit.dart';
import 'package:housemanuser/controller/signout/signout_cubit.dart';
import 'package:housemanuser/controller/theme_cubit.dart';
import 'package:housemanuser/controller/user/user_cubit.dart';
import 'package:housemanuser/firebase_options.dart';

import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/ui/views/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  getToken();
  runApp(const HousemanUser());
}

getToken() async {
  try {
    String? myToken = await FirebaseMessaging.instance.getToken();
    // String token = await Candidate().getToken();
    log("==================================");
    log('$myToken');
  } catch (e) {
    log(e.toString());
  }
}

class HousemanUser extends StatelessWidget {
  const HousemanUser({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => RegistrationCubit(),
          ),
          BlocProvider(
            create: (context) => RememberCubit(),
          ),
          BlocProvider(create: (_) => ResetCubit()),
          BlocProvider(create: (_) => UserCubit()),
          BlocProvider(create: (_) => ReviewCubit()),
          BlocProvider(create: (_) => BookingCubit()),
          BlocProvider(create: (_) => NotificationCubit()),
          BlocProvider(create: (_) => ProfileCubit()),
          BlocProvider(create: (_) => ThemeCubit()),
          BlocProvider(create: (_) => ChatCubit()),
          BlocProvider(create: (_) => SignOutCubit()),

          BlocProvider(create: (_) => LocalizationCubit()),
          BlocProvider(create: (_) => HousemanCubit()),
          BlocProvider(create: (_) => ServicesCubit()),
          BlocProvider(create: (_) => ProviderCubit()),
          BlocProvider(create: (_) => SearchCubit()),
          BlocProvider(create: (_) => SearchServiceCubit()),
          BlocProvider(create: (_) => RatingCubit()),
          // BlocProvider(create: (_) => AddServiceCubit()),
          // BlocProvider(create: (_) => GetServiceCubit()),

          BlocProvider(create: (_) => WrittenSearchCubit()),
          // BlocProvider(create: (_) => ChatMessageCubit()),
        ],
        child:
            BlocBuilder<ThemeCubit, ThemeMode>(builder: (context, themeMode) {
          return BlocBuilder<LocalizationCubit, LocalizationState>(
              builder: (context, state) {
            return MaterialApp(
              locale: state.locale,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              themeMode: themeMode,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: Colors.white,
                brightness: Brightness.light,
              ),
              darkTheme: ThemeData(
                primarySwatch: Colors.deepPurple,
                scaffoldBackgroundColor: Colors.black,
                brightness: Brightness.dark,
              ),
              home: const Splash(),
            );
          });
        }));
  }
}
