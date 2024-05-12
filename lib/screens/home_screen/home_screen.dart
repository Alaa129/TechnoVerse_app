import 'package:alaa/screens/home_screen/widgets/animated_card.dart';
import 'package:alaa/screens/todo_screens/ui/widgets/todo_item_card.dart';
import 'package:alaa/widget/custom_app_bar.dart';
import 'package:alaa/widget/custom_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(height * .3),
            child: CustomAppBar(
              name: " Hello,\n     A'laa",
              image: 'assets/images/3.png', //send from database the name.
            )),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (context, index) {
            return AnimatedCard();
          },
        ));
  }
}
