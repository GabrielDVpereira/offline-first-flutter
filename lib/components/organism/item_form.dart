import 'dart:math';

import 'package:flutter/material.dart';
import 'package:offline_first_app_flutter/components/atoms/button.dart';
import 'package:offline_first_app_flutter/components/atoms/input.dart';
import 'package:offline_first_app_flutter/components/atoms/text.dart';
import 'package:offline_first_app_flutter/models/item.dart';

// ignore: must_be_immutable
class ItemForm extends StatelessWidget {
  String? title;
  String? description;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final void Function(Item item) onSubmit;
  ItemForm({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  void _onSubmit(BuildContext context) {
    formkey.currentState?.save();
    Item item = Item(
      id: Random().nextDouble(),
      description: description ?? '',
      title: title ?? '',
    );
    onSubmit(item);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomText.title(
            'New Item',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          CustomInput(
            placeholder: 'Item title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 10),
          CustomInput(
            placeholder: 'Item description',
            onSaved: (value) {
              description = value;
            },
          ),
          const SizedBox(height: 20),
          CustomButton(
            description: 'Create Item',
            onPressed: () => _onSubmit(context),
          ),
        ],
      ),
    );
  }
}
