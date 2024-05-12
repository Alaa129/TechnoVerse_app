import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.name, required this.image});
  final String? name;
  final String image;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: height * .3,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 88, 101, 224),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
      ),
      title: Text(
        "$name",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28),
      ),
    );
  }
}
