import 'package:alaa/constant/routes.dart';
import 'package:alaa/widget/custom_button.dart';
import 'package:alaa/widget/custom_text.dart';
import 'package:alaa/widget/custom_text_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.3,
              width: width,
              color: Color.fromARGB(255, 88, 101, 224),
              child: Center(
                child: Image.asset(
                  'assets/images/login1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    txt: 'Welcom to Our application',
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        txt: 'Sign In',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                      RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: 'Help',
                            style: TextStyle(
                                color: Color.fromARGB(255, 119, 104, 233),
                                fontSize: 15)),
                        WidgetSpan(
                            child: Icon(
                          Icons.help,
                          color: Color.fromARGB(255, 105, 91, 211),
                          size: 17,
                        ))
                      ])),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  const CustomTxtForm(
                      txt: 'Email',
                      hint: 'type your email',
                      errorMsg: 'Please type your email'),
                  SizedBox(height: height * 0.02),
                  const CustomTxtForm(
                    txt: 'Password',
                    hint: 'your password',
                    errorMsg: 'Enter your password',
                    isPassword: true,
                  ),
                  SizedBox(height: height * 0.05),
                  CustomButton(
                    onPress: () {
                      //notice: put the function to check the email and password.
                      Navigator.of(context).pushNamed(Routes.bottomNav);
                    },
                    txt: 'Sign In',
                    color: Color.fromARGB(255, 88, 101, 224),
                    textColor: Colors.white,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                          txt: " Doesn't has any account ? ", fontSize: 15),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Routes.registerScreen);
                        },
                        child: const CustomText(
                          txt: 'Register here',
                          fontSize: 15,
                          color: Color.fromARGB(255, 88, 101, 224),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
