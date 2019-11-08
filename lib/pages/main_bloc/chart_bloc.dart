
import 'package:flutter/cupertino.dart';

class ChartBloc extends ChangeNotifier{
  static final String flutter = "Flutter";
  static final String reactNative = "ReactNative";
  static final String android = "Android";
  static final String ios = "IOS";

  Map<String, double> statistics = {flutter : 0.0, reactNative : 0.0, android : 0.0, ios : 0.0};
  Map<String, double> get chartMap => statistics;

  void updateModel(String key, double value) {
    if(statistics.containsKey(key)){
      statistics[key] = value * 100;
      notifyListeners();
    }
  }


}