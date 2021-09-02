import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TextType { title, paragraph }

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextType type;

  const CustomText(
    this.text, {
    Key? key,
    this.style,
    this.type = TextType.paragraph,
  }) : super(key: key);

  const CustomText.title(
    this.text, {
    Key? key,
    this.style,
    this.type = TextType.title,
  }) : super(key: key);

  const CustomText.paragraph(
    this.text, {
    Key? key,
    this.style,
    this.type = TextType.paragraph,
  }) : super(key: key);

  TextStyle _getTextSize() {
    if (type == TextType.title) {
      return const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
      );
    }
    return const TextStyle(fontSize: 16);
  }

  TextStyle _getStyle() {
    if (style != null) {
      return _getTextSize().merge(style);
    }
    return _getTextSize();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _getStyle(),
    );
  }
}
