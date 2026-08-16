import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

enum ConnectivityStatus { checking, connected, disconnected }

class NetworkObserver extends ChangeNotifier {
  NetworkObserver._() {
    _sub = Connectivity().onConnectivityChanged.listen(_handleResults);
    _checkNow();
  }

  static final NetworkObserver instance = NetworkObserver._();

  ConnectivityStatus _status = ConnectivityStatus.checking;
  ConnectivityStatus get status => _status;
  bool get isConnected => _status == ConnectivityStatus.connected;

  late final StreamSubscription<List<ConnectivityResult>> _sub;

  Future<void> _checkNow() async {
    final results = await Connectivity().checkConnectivity();
    _handleResults(results);
  }

  void _handleResults(List<ConnectivityResult> results) {
    final connected = results.isNotEmpty && !results.contains(ConnectivityResult.none);
    _status = connected ? ConnectivityStatus.connected : ConnectivityStatus.disconnected;
    notifyListeners();
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}