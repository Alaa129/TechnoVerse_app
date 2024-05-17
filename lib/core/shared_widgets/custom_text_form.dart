import 'package:alaa/core/shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTxtForm extends StatelessWidget {
  const CustomTxtForm(
      {Key? key,
      required this.txt,
      required this.hint,
      this.passwordTxt,
      required this.errorMsg,
      this.isPassword = false,
      this.suffixIcon,
      this.controller})
      : super(key: key);
  final String txt;
  final String hint;
  final String errorMsg;
  final bool? passwordTxt;
  final bool? isPassword;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(txt: txt, fontSize: 16),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: controller,
          obscureText: isPassword!,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 233, 232, 232),
            suffixIcon: suffixIcon,
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(30.0), // Circular border radius
              borderSide: BorderSide.none, // No border
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return errorMsg;
            }
            return null;
          },
          onSaved: (value) {},
        ),
      ],
    );
  }
}
