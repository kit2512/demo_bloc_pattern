class Validation {
  static bool isValidUsername(String username) {
    return username.length > 6 && username.contains("@");
  }

  static bool isValidPassword(String password) {
    return password.length > 6;
  }
}
