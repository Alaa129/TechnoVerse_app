import 'package:alaa/core/routing/routes.dart';
import 'package:alaa/core/shared_widgets/custom_button.dart';
import 'package:alaa/core/shared_widgets/custom_text.dart';
import 'package:alaa/core/shared_widgets/custom_text_form.dart';
import 'package:alaa/core/shared_widgets/google_custom_button.dart';
import 'package:alaa/features/auth_screens/logic/cubit/google_auth_cubit.dart';
import 'package:alaa/features/auth_screens/widgets/phone_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.3,
              width: double.infinity,
              child: Image.asset(
                'assets/images/login.png',
                fit: BoxFit.cover,
              ),
            ),
            //in call
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    txt: 'Welcom to Our Application',
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
                        txt: 'Register',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                      RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: 'Help',
                            style: TextStyle(
                                color: Color.fromARGB(225, 88, 101, 224),
                                fontSize: 15)),
                        WidgetSpan(
                            child: Icon(
                          Icons.help,
                          color: Color.fromARGB(225, 88, 101, 224),
                          size: 15,
                        ))
                      ])),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  const CustomTxtForm(
                    txt: 'Email',
                    hint: 'eg.exampel@gmail.com',
                    errorMsg: 'Please Enter Your Email',
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  const CustomTxtForm(
                      txt: 'Password',
                      hint: 'Password',
                      passwordTxt: true,
                      isPassword: true,
                      suffixIcon: Icon(Icons.remove_red_eye),
                      errorMsg: 'Enter Password From 8 Numbers'),
                  SizedBox(height: height * 0.05),
                  CustomButton(
                      onPress: () {},
                      color: Color.fromARGB(255, 88, 101, 224),
                      textColor: Colors.white,
                      txt: 'Register'),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  GoogleCustomButton(
                    border: Border.all(
                    color: Colors.grey,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    context.read<GoogleAuthCubit>().signInWithGoogle().then((_) {
                      Navigator.of(context).pushNamed(Routes.bottomNav);
                    }).catchError(
                      (error) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(error.toString()),
                        ));
                    }
                    );
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
                      Text(
                        'Continue with Google',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                        )
                      ),
                    ],
                  ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(txt: 'Has any account ? ', fontSize: 15),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.loginScreen);
                        },
                        child: const CustomText(
                          txt: 'Sign in here',
                          fontSize: 15,
                          color: Color.fromARGB(255, 57, 65, 142),
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
