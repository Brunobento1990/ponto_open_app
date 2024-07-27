import 'package:flutter/material.dart';

class LoadingNotifier extends ChangeNotifier {
  bool _loading = false;

  void setLoading(bool newLoading) {
    _loading = newLoading;
    notifyListeners();
  }

  bool getLoading() {
    return _loading;
  }
}
