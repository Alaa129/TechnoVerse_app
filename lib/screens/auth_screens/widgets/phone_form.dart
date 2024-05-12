import 'package:alaa/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneForm extends StatelessWidget {
  PhoneForm({Key? key}) : super(key: key);

  PhoneNumber userNumber = PhoneNumber(isoCode: 'EG');
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          txt: 'Phone Number',
          fontSize: 15,
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Row(children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(6.0))),
              child: InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  phoneNumber = number.phoneNumber.toString();
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.DROPDOWN,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                hintText: "Phone number",
                selectorTextStyle: const TextStyle(color: Colors.black),
                initialValue: userNumber,
                formatInput: false,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
