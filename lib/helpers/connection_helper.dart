import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class Connection {
  StreamSubscription<ConnectivityResult>? subscription;

  listen(Function(ConnectivityResult) cb) {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      cb(result);
    });
  }

  removeListener() {
    subscription!.cancel();
  }
}
