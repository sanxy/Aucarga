class LoginViewModel {
  bool validateEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool validatePassword(String password) {
    return password.length >= 8; // At least 8 characters
  }
}
