import 'package:flutter/material.dart';
import 'package:offline_first_app_flutter/screens/home_screen.dart';

import 'constants/colors.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: CustomColors.primary,
        accentColor: CustomColors.secondary,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: CustomColors.secondary,
        ),
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: CustomColors.background,
      ),
      home: HomeScreen(),
    );
  }
}
