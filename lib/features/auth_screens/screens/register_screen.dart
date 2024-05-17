import 'package:alaa/core/routing/routes.dart';
import 'package:alaa/core/shared_widgets/custom_button.dart';
import 'package:alaa/core/shared_widgets/custom_text.dart';
import 'package:alaa/core/shared_widgets/custom_text_form.dart';
import 'package:alaa/core/shared_widgets/google_custom_button.dart';
import 'package:alaa/features/auth_screens/logic/cubit/google_auth_cubit.dart';
import 'package:alaa/features/auth_screens/logic/cubit/google_auth_state.dart';
import 'package:alaa/features/auth_screens/widgets/auth_bloc_listener.dart';
import 'package:alaa/features/auth_screens/widgets/phone_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        // key: context.read<GoogleAuthCubit>().formKey,
        child: Form(
          key: context.read<GoogleAuthCubit>().formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.3,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/security.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              //in call
              SizedBox(
                height: height * 0.012,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            color: Color.fromARGB(224, 88, 101, 224),
                            size: 15,
                          ))
                        ])),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.012,
                    ),
                    CustomTxtForm(
                        txt: '',
                        hint: 'Username',
                        errorMsg: 'Please Enter Your Name',
                        controller:
                            context.read<GoogleAuthCubit>().userNameController),
                    CustomTxtForm(
                      txt: '',
                      hint: 'Email Address',
                      errorMsg: 'Please Enter Your Email',
                      controller:
                          context.read<GoogleAuthCubit>().emailController,
                    ),
                    CustomTxtForm(
                        txt: '',
                        hint: 'Password',
                        passwordTxt: true,
                        isPassword: passToggle ? true : false,
                        controller:
                            context.read<GoogleAuthCubit>().passwordController,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          icon: passToggle
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                        errorMsg: 'Enter Password From 8 Numbers'),
                    SizedBox(height: height * 0.05),
                    CustomButton(
                        onPress: () {
                          if (context
                              .read<GoogleAuthCubit>()
                              .formKey
                              .currentState!
                              .validate()) {
                            context.read<GoogleAuthCubit>().signUp();
                          }
                        },
                        color: Color.fromARGB(255, 88, 101, 224),
                        textColor: Colors.white,
                        txt: 'Register'),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    GoogleCustomButton(
                      borderRadius: 30.h,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      color: Colors.white,
                      onPressed: () {
                        context.read<GoogleAuthCubit>().signInWithGoogle();
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
                      height: height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText(
                            txt: 'Has any account ? ', fontSize: 15),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(Routes.loginScreen);
                          },
                          child: const CustomText(
                            txt: 'Sign in here',
                            fontSize: 15,
                            color: Color.fromARGB(255, 57, 65, 142),
                          ),
                        ),
                        AuthBlocListener(),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
