import 'package:alaa/core/routing/routes.dart';
import 'package:alaa/core/shared_widgets/custom_button.dart';
import 'package:alaa/core/shared_widgets/custom_page_view.dart';
import 'package:alaa/core/shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: height * 0.06,
                width: width * 0.18,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.brown[100]),
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.loginScreen);
                    },
                    child: const CustomText(txt: 'Skip', fontSize: 15)),
              ),
            ),
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 2;
                  });
                },
                children: const [
                  CustomPageView(
                    imgUrl: 'assets/images/onBoarding_todo_list.png',
                    text1:
                        'Watch the educational videos\n and follow your progress',
                    text2:
                        'We help you know the requirements of the field of\n technology and follow your progress',
                  ),
                  CustomPageView(
                    imgUrl: 'assets/images/onBoarding_vedio.png',
                    text1:
                        'Develop your skills and learn\n a lot of information',
                    text2: '',
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 2,
              onDotClicked: (index) {
                controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
              effect: CustomizableEffect(
                  activeDotDecoration: DotDecoration(
                      color: Color.fromARGB(255, 88, 101, 224),
                      height: height * 0.01,
                      width: width * 0.04,
                      borderRadius: BorderRadius.circular(10)),
                  dotDecoration: DotDecoration(
                      color: Colors.grey,
                      height: height * 0.01,
                      width: width * 0.04,
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            CustomButton(
                txt: 'Get Started',
                color: Color.fromARGB(255, 88, 101, 224),
                textColor: Colors.white,
                onPress: () {
                  Navigator.of(context).pushNamed(Routes.loginScreen);
                }),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  txt: "Don't have an account?",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.registerScreen);
                    },
                    child: const CustomText(
                      txt: 'Sign Up',
                      fontSize: 15,
                      color: Color.fromARGB(255, 105, 91, 211),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
