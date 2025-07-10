class Authentication {
  String? validateUserName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Enter user name';
    }
    if (name.contains(' ')) {
      return 'user name must not contain empty space';
    }
    if (name.length < 4) {
      return 'name should contain at least 4 characters';
    }
    if (name.length > 16) {
      return 'name can contain at most 16 characters';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Enter Password';
    }
    if (password.length < 4) {
      return 'password should contain at least 4 characters';
    }
    if (!password.contains(RegExp(r'\d'))) {
      return 'password must contain at least 1 number';
    }
    return null;
  }

  String? validateUserEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Enter email';
    }

    // Basic email validation pattern
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

    if (!emailRegex.hasMatch(email)) {
      return 'Enter a valid email';
    }

    return null;
  }
}
