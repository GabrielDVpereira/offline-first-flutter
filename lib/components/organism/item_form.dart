import 'package:flutter/material.dart';
import 'package:offline_first_app_flutter/components/atoms/button.dart';
import 'package:offline_first_app_flutter/components/atoms/input.dart';
import 'package:offline_first_app_flutter/components/atoms/text.dart';

class ItemForm extends StatelessWidget {
  const ItemForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText.title(
          'New Item',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 20),
        CustomInput(placeholder: 'Item title'),
        SizedBox(height: 10),
        CustomInput(placeholder: 'Item description'),
        SizedBox(height: 20),
        CustomButton(
          description: 'Create Item',
          onPressed: () {},
        ),
      ],
    );
  }
}
