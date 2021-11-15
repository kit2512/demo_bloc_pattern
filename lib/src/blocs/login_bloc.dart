import 'dart:async';

import '../validators/validation.dart';

class LoginBlog {
  final StreamController<String> _userController = StreamController<String>();
  final StreamController<String> _passwordController =
      StreamController<String>();

  Stream<String> get userStream => _userController.stream;
  Stream<String> get passswordStream => _passwordController.stream;

  bool isValidInfo(String username, String password) {
    if (!Validation.isValidUsername(username)) {
      _userController.sink.addError("Invalid username");
      return false;
    }
    _userController.add("OK");
    if (!Validation.isValidPassword(password)) {
      _passwordController.sink.addError("Invalid password");
      return false;
    }
    _passwordController.add("OK");

    return true;
  }

  void dispose() {
    _userController.close();
    _passwordController.close();
  }
}
