import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task/features/auth/presentation/screens/forget_pass.dart';

void main() {
  testWidgets('Forget password screen UI test', (WidgetTester tester) async {
    // Step 1: Build the ForgetPass widget inside a MaterialApp
    await tester.pumpWidget(MaterialApp(home: ForgetPass()));

    // Step 2: Check if "Reset Password" title is there
    expect(find.text('Reset Password'), findsOneWidget);

    // Step 3: Enter an email in the TextField
    await tester.enterText(find.byType(TextFormField), 'test@example.com');

    // Step 4: Tap the button to send reset email
    await tester.tap(find.text('Send Reset Email'));

    // Step 5: Let the widget rebuild
    await tester.pump();
  });
}
