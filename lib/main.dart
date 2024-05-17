import 'package:alaa/core/di/dependency_injection.dart';
import 'package:alaa/core/routing/app_router.dart';
import 'package:alaa/core/routing/routes.dart';
import 'package:alaa/core/helpers/database_helper.dart';
import 'package:alaa/features/home_screen/home_screen.dart';
import 'package:alaa/features/todo_screens/logic/cubit/add_task_cubit.dart';
import 'package:alaa/features/todo_screens/ui/screens/todo_screen.dart';
import 'package:alaa/features/videos_screen.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await ScreenUtil.ensureScreenSize();
  final databaseHelper = DatabaseHelper.dbProvider;
  databaseHelper.db;
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  setupGetIt();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  
  void initialization() async {
    await Future.delayed(const Duration(milliseconds: 300));
    FlutterNativeSplash.remove();
  }
  runApp(TechnoVerse(
    appRouter: AppRouter(),
  ));
}

String email = "";

class TechnoVerse extends StatelessWidget {
  final AppRouter appRouter;

  const TechnoVerse({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
        minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TechnoVerse',
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
