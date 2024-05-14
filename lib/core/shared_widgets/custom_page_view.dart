import 'package:alaa/core/shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({
    Key? key,
    required this.imgUrl,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  final String imgUrl;
  final String text1;
  final String text2;

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: height * 0.4,
          width: double.infinity,
          child: Image.asset(
            widget.imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: height * 0.05,
        ),
        CustomText(
          txt: widget.text1,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: height * 0.03,
        ),
        CustomText(
          txt: widget.text2,
          fontSize: 15,
          color: Colors.grey,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
