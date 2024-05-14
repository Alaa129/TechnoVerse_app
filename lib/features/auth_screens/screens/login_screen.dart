import 'package:alaa/core/routing/routes.dart';
import 'package:alaa/core/shared_widgets/custom_button.dart';
import 'package:alaa/core/shared_widgets/custom_text.dart';
import 'package:alaa/core/shared_widgets/custom_text_form.dart';
import 'package:alaa/core/shared_widgets/google_custom_button.dart';
import 'package:alaa/features/auth_screens/logic/cubit/google_auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * 0.3,
              width: width,
              // color: Color.fromARGB(255, 88, 101, 224),
              child: Center(
                child: Image.asset(
                  'assets/images/login1.png',
                  fit: BoxFit.fill,
                  // height: 350.h,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText(
                    txt: 'Welcom to Our application',
                    fontSize: 12,
                    color: Colors.grey,
                    textAlign: TextAlign.start,
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
                  SizedBox(
                    height: 35.h,
                  ),
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
                    height: 20.h,
                  ),
                  Text(
                    '__OR__',
                    style: TextStyle(color: Colors.grey, fontSize: 15.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.02),
                  GoogleCustomButton(
                    borderRadius: 30.h,
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    color: Colors.white,
                    onPressed: () {
                      context
                          .read<GoogleAuthCubit>()
                          .signInWithGoogle()
                          .then((_) {
                        Navigator.of(context).pushReplacementNamed(Routes.bottomNav);
                      }).catchError((error) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(error.toString()),
                        ));
                      });
                    },
                    textWidget: Row(
                      children: [
                        Image.asset(
                          'assets/images/google_icon.png',
                          height: 25.h,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text('Continue with Google',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                            )),
                      ],
                    ),
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