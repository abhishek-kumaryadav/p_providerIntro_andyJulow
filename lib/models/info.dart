// class Info {
//   String title = "Default Title";
//   String description = "Default Description";
//   Info() {}
// }
import 'package:flutter/foundation.dart';

class Info with ChangeNotifier {
  String _title = "DEF title";
  String _desc = "DEF desc";
  Info() {
    // _title = "DEF title";
    // _desc = "DEF desc";
  }

  String get title => _title;
  String get desc => _desc;
  changeTitle(String ntit) {
    _title = ntit;
    notifyListeners();
  }

  changeDesc(String value) {
    _desc = value;
    notifyListeners();
  }
}
