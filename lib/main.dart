import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:later/DataStorage/DB_Helper.dart';
import 'package:later/appRouter.dart';
import 'package:later/screens/Messages.dart';
import 'package:later/screens/Posts.dart';

import 'screens/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/langs',
      fallbackLocale: const Locale('en'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(530, 960),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: AppRouter.navKey,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: Home(),
          // onGenerateRoute: (RouteSettings routeSettings) {
          //   String? name = routeSettings.name;
          //   dynamic arguments = routeSettings.arguments;
          //   switch (name) {
          //     case Home.ScreenName:
          //       return MaterialPageRoute(builder: (context) {
          //         return Home();
          //       });
          //     case Posts.ScreenName:
          //       return MaterialPageRoute(builder: (context) {
          //         return Posts();
          //       });
          //     case Messages.ScreenName:
          //       return MaterialPageRoute(builder: (context) {
          //         return Messages();
          //       });
          //   }
          // },
        );
      },
    );
  }
}
