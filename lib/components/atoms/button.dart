import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String description;
  final void Function() onPressed;

  const CustomButton({
    Key? key,
    required this.description,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).accentColor),
        ),
        onPressed: onPressed,
        child: Text(
          description,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
