import 'package:firebase_auth/firebase_auth.dart';

enum AuthType {
  Google,
  Email;

  String toJson() => name;

  static AuthType fromJson(String json) => values.byName(json);

  String get provider {
    switch (this) {
      case AuthType.Google:
        return 'google.com';
      case AuthType.Email:
        return 'password';
    }
  }
}
