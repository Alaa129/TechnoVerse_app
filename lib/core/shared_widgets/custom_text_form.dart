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
      this.suffixIcon, this.controller})
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
              suffixIcon: suffixIcon,
              hintText: hint,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)))),
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
