import 'package:flutter/material.dart';
import 'package:offline_first_app_flutter/constants/colors.dart';

class CustomInput extends StatelessWidget {
  final String placeholder;
  final void Function(String?) onSaved;
  const CustomInput(
      {required this.placeholder, required this.onSaved, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: CustomColors.light_gray,
        hintText: placeholder,
        hintStyle: TextStyle(
            color: Colors.grey[400], fontFamily: 'Montserrat', fontSize: 14),
      ),
    );
  }
}
