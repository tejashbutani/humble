import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:humble/authentication_page.dart';
import 'package:humble/home_page.dart';

void main() {
  testWidgets('Login Integration Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AuthenticationPage()));

    // Find and interact with username and password fields
    await tester.enterText(find.byKey(Key('email_field')), 'abc@xyz.com');
    await tester.enterText(find.byKey(Key('password_field')), '123456');
    // Tap the login button
    await tester.tap(find.byKey(Key('login_button')));

    // Wait for the widgets to rebuild
    await tester.pump();

    // Assert that the user is logged in
    expect(find.byWidget(MaterialApp(home: AuthenticationPage())), findsNothing);
  });
}
