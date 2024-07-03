import 'package:flutter/material.dart';
class UserModel extends ChangeNotifier {
  bool isLoggedIn = false;
  String? UId, Uname, Uemail;

  void setLoggedIn(bool value, String? id) {
    isLoggedIn = value;
    UId = id;
    notifyListeners();
  }

  void updateData(String? uname, String? uemail) {
    Uname = uname;
    Uemail = uemail;
    notifyListeners();
  }

}
