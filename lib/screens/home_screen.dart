import 'package:flutter/material.dart';
import 'package:offline_first_app_flutter/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: CustomColors.primary,
        accentColor: CustomColors.primary,
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: CustomColors.background,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Offline first app'),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Add new item',
          child: Icon(
            Icons.add,
            color: CustomColors.white,
          ),
        ),
      ),
    );
  }
}
