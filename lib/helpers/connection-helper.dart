import 'dart:async';

import 'package:data_connection_checker/data_connection_checker.dart';

class ConectionHelper {
  StreamSubscription<DataConnectionStatus>? listener;

  checkConnection() async {
    listener = DataConnectionChecker().onStatusChange.listen((status) {
      print(status);
    });
  }
}
