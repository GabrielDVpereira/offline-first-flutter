import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:offline_first_app_flutter/helpers/connection_helper.dart';
import 'package:offline_first_app_flutter/screens/home_screen.dart';
import 'package:offline_first_app_flutter/services/offline_db.dart';

import 'constants/colors.dart';

void main() async {
  await OfflineDb.setupDB();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    Connection().listen(
        (connectioData) => print(connectioData == ConnectivityResult.mobile));
    super.initState();
  }

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
