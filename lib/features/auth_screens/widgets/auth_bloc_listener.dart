import 'package:alaa/core/routing/routes.dart';
import 'package:alaa/features/auth_screens/logic/cubit/google_auth_cubit.dart';
import 'package:alaa/features/auth_screens/logic/cubit/google_auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBlocListener extends StatelessWidget {
  const AuthBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GoogleAuthCubit, GoogleAuthStatus>(
      listener: (context, state) {
        if (state == GoogleAuthStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Color(0xFF7768E9),
              content: Text("Error occurred , please try again"),
            ),
          );
        } else if (state == GoogleAuthStatus.authenticated) {
          Navigator.of(context).pushNamed(Routes.bottomNav);
        } else if (state == GoogleAuthStatus.loading) {
          Center(
              child: CircularProgressIndicator(
            color: Color(0xFF7768E9),
          ));
        } 
      },
      child: const SizedBox.shrink(),
    );
  }
}
