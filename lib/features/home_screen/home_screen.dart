import 'package:alaa/features/auth_screens/logic/cubit/google_auth_cubit.dart';
import 'package:alaa/features/home_screen/widgets/animated_card.dart';
import 'package:alaa/features/todo_screens/ui/widgets/todo_item_card.dart';
import 'package:alaa/core/shared_widgets/custom_app_bar.dart';
import 'package:alaa/core/shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

   String getFirstName(User user) {
  // Split the user's display name to extract the first name
  List<String> nameParts = user.displayName!.split(' ');
  return nameParts.isNotEmpty ? nameParts[0] : ''; // Return the first name
}

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(height * .3),
            child: CustomAppBar(
              name: " Hello,\n     ${context.read<GoogleAuthCubit>().firstName}",
              image: 'assets/images/3.png', //send from database the name.
            )),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (context, index) {
            return AnimatedCard(index: index,);
          },
        ));
  }
}
