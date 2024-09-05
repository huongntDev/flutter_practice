import 'package:flutter/foundation.dart';

import 'CounterModel.dart';

class CounterViewModel extends ChangeNotifier {
  final CounterModel model;
  int? count;
  String? errorMessage;

  CounterViewModel(this.model);

  Future<void> init() async {
    try {
      final data = await model.loadCountFromServer();
      count = data.count;
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> increment(int count) async {
    var count = this.count;
    if (count == null) {
      throw ("Not initialized");
    }
    try {
      final data = await model.updateCountOnServer(count + 1);
      count = data.count;
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
