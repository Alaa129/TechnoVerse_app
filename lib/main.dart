import 'package:alaa/constant/app_router.dart';
import 'package:alaa/constant/routes.dart';
import 'package:alaa/helpers/database_helper.dart';
import 'package:alaa/screens/home_screen/home_screen.dart';
import 'package:alaa/screens/todo_screens/logic/cubit/add_task_cubit.dart';
import 'package:alaa/screens/todo_screens/ui/screens/todo_screen.dart';
import 'package:alaa/screens/videos_screen.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final databaseHelper = DatabaseHelper.dbProvider;
  databaseHelper.db;

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TechnoVerse',
      initialRoute: Routes.onBoardingScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
