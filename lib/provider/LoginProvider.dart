import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool isCreateAccountPage;
  LoginProvider({required this.isCreateAccountPage});
  //true if change to Create Account Page and false for LogIn page
  void changeLoginPage({required bool isCreateAccount}) async {
    isCreateAccountPage = isCreateAccount;
    notifyListeners();
  }
}
