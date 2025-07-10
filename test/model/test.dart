import 'package:flutter_test/flutter_test.dart';
import 'package:task/core/validator/auth_validator.dart';

void main() {
  final auth = Authentication();

  group('Password Validator', () {
    test('Valid password', () {
      expect(auth.validatePassword('ScoobyDoo1'), null);
    });

    test('Password < 4 characters', () {
      expect(auth.validatePassword('Sc1'),
          'password should conatin atleast 4 characters');
    });

    test('Password without number', () {
      expect(auth.validatePassword('ScoobyDoooo'),
          'password must contain atleast 1 number');
    });

    test('Empty password', () {
      expect(auth.validatePassword(''), 'Enter Password');
    });
  });

  group('Username Validator', () {
    test('Empty username', () {
      expect(auth.validateUserName(null), 'Enter user name');
    });

    test('Username < 4 characters', () {
      expect(auth.validateUserName('Tom'),
          'name should conatin atleast 4 characters');
    });

    test('Username > 16 characters', () {
      expect(auth.validateUserName('Tom12345678910111213'),
          'name can conatin atmost 16 characters');
    });

    test('Username with space', () {
      expect(auth.validateUserName('Scooby Doo'),
          'user name must not contain empty space');
    });

    test('Valid username', () {
      expect(auth.validateUserName('ScoobyDoo'), null);
    });
  });

  group('Email Validator', () {
    test('Empty email', () {
      expect(auth.validateUserEmail(''), 'Enter email');
    });

    test('Invalid email format', () {
      expect(auth.validateUserEmail('invalid'), 'Enter a valid email');
    });

    test('Valid email', () {
      expect(auth.validateUserEmail('test@example.com'), null);
    });
  });
}
