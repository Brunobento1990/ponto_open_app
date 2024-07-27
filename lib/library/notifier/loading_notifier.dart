import 'package:flutter/material.dart';

class LoadingNotifier extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool newLoading) {
    _loading = newLoading;
    notifyListeners();
  }
}
