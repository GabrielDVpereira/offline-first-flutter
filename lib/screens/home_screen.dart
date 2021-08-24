import 'package:flutter/material.dart';
import 'package:offline_first_app_flutter/components/atoms/text.dart';
import 'package:offline_first_app_flutter/components/molecule/item_card.dart';
import 'package:offline_first_app_flutter/components/organism/item_form.dart';
import 'package:offline_first_app_flutter/constants/colors.dart';
import 'package:offline_first_app_flutter/utils/modal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 26),
              CustomText.title('Offline first app ✨'),
              SizedBox(height: 20),
              ItemCard(title: 'Title', description: 'teste'),
              ItemCard(title: 'Title', description: 'teste')
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openModal(content: ItemForm(), ctx: context);
        },
        tooltip: 'Add new item',
        child: Icon(
          Icons.add,
          color: CustomColors.white,
        ),
      ),
    );
  }
}
