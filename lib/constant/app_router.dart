import 'package:alaa/constant/routes.dart';
import 'package:alaa/screens/auth_screens/screens/login_screen.dart';
import 'package:alaa/screens/auth_screens/screens/register_screen.dart';
import 'package:alaa/screens/home_screen/home_screen.dart';
import 'package:alaa/screens/onboarding_screen.dart';
import 'package:alaa/screens/todo_screens/ui/screens/add_todo_screen.dart';
import 'package:alaa/screens/todo_screens/logic/cubit/add_task_cubit.dart';
import 'package:alaa/screens/todo_screens/ui/screens/todo_screen.dart';
import 'package:alaa/screens/videos_screen.dart';
import 'package:alaa/widget/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen(),
        );

        case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.videoScreen:
        return MaterialPageRoute(
          builder: (_) => VideoScreen(),
        );
      case Routes.bottomNav:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(create: (context)=> AddTaskCubit(),
          child: BottomNav(),)
        );
      case Routes.todoScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(create: (context)=> AddTaskCubit(),
          child: TodoScreen(),),
        );
        case Routes.addTodoScreen:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(create: (context)=> AddTaskCubit(),
          child: AddTodoScreen(),),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}