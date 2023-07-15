import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login Integration Test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Find and interact with username and password fields
    await tester.enterText(find.byKey(Key('username_field')), 'username');
    await tester.enterText(find.byKey(Key('password_field')), 'password');

    // Tap the login button
    await tester.tap(find.byKey(Key('login_button')));

    // Wait for the widgets to rebuild
    await tester.pump();

    // Assert that the user is logged in
    expect(find.text('Welcome, username'), findsOneWidget);
  });
}