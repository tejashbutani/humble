import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:humble/authentication_page.dart';

void main(){

  testWidgets('Check if Image logo is dispalyed', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: AuthenticationPage()));
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('Login Function Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AuthenticationPage()));

    final emailFieldFinder = find.byKey(Key('email_field'));
    final passwordFieldFinder = find.byKey(Key('password_field'));
    final loginButtonFinder = find.byKey(Key('login_button'));

    // Enter valid email and password
    await tester.enterText(emailFieldFinder, 'abc@xyz.com');
    await tester.enterText(passwordFieldFinder, '123456');

    // Tap the login button
    await tester.tap(loginButtonFinder);
    await tester.pump();

    // Check if it navigates to HomePage
    expect(find.text('OK'), findsNothing);
  });

}