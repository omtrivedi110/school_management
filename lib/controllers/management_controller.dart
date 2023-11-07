import 'package:flutter/material.dart';

class SchoolController extends ChangeNotifier {
  String logger = 'student';

  changeLogger({required String val}) {
    logger = val;
    notifyListeners();
  }
}
