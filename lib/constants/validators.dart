class Validators {
  String? usernameValidator(String? username) {
    if (username!.isEmpty) {
      return 'Enter Email';
    }
    return null;
  }

  String? passwordValidator(String? pass) {
    if (pass!.isEmpty) {
      return 'Enter password';
    }
    return null;
  }
}
