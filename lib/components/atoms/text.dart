import 'package:flutter/cupertino.dart';

enum TextType { title, paragraph }

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextType type;

  const TextWidget(this.text,
      {Key? key, this.style, this.type = TextType.paragraph})
      : super(key: key);

  const TextWidget.title(this.text,
      {Key? key, this.style, this.type = TextType.title})
      : super(key: key);

  const TextWidget.paragraph(this.text,
      {Key? key, this.style, this.type = TextType.paragraph})
      : super(key: key);

  TextStyle _getTextSize() {
    if (type == TextType.title) {
      return TextStyle(fontSize: 26);
    }
    return TextStyle(fontSize: 18);
  }

  TextStyle _getStyle() {
    if (style != null) {
      return style!.merge(_getTextSize());
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
