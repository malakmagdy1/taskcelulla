import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task/features/auth/presentation/screens/loginScreen.dart';

void main() {
  testWidgets('Login: Shows validation errors if fields are empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    // Tap the "LOGIN" button
    final loginButton = find.text('LOGIN');
    expect(loginButton, findsOneWidget);

    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // Expect validation errors
    expect(find.text('Please enter your email'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
  });
}
