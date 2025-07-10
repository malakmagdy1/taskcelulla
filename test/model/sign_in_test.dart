import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task/features/auth/presentation/screens/signinScreen.dart';

void main() {
  testWidgets('SignIn: Shows validation errors if fields are empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SignInscreen(),
      ),
    );

    // Tap the "Next" button without filling anything
    final nextButton = find.text('Next');
    expect(nextButton, findsOneWidget);

    await tester.tap(nextButton);
    await tester.pumpAndSettle();

    // Expect validation errors
    expect(find.text('Enter your name'), findsOneWidget);
    expect(find.text('Enter email'), findsOneWidget);
    expect(find.text('Enter password'), findsOneWidget);
  });
}
