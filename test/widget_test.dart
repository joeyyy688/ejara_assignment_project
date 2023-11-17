// ignore_for_file: file_names

import 'package:ejara_assignment_project/screens/newMobileMoneyScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('NewMobileMoneyScreen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: NewMobileMoneyScreen(),
      ),
    );

    // Verify the initial UI state.
    expect(find.text('New Mobile Money'), findsOneWidget);
    expect(find.text('Choose the mobile money operator'), findsOneWidget);
    expect(find.text('Phone number'), findsOneWidget);
    expect(find.text('Full name'), findsOneWidget);
    expect(find.text('Save as payment method'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);

    // Interact with the widgets
    await tester.tap(find.byType(DropdownButton<String>), warnIfMissed: false);
    await tester.pump();

    await tester.enterText(
        find.byType(TextField).at(0), '1234567890'); // Phone number
    await tester.enterText(
        find.byType(TextField).at(1), 'John Doe'); // Full name

    await tester.pump();

    // Verify the updated UI state after interactions.
    expect(find.text('Save as payment method'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);

    await tester.tap(find.text('Continue'), warnIfMissed: false);
    await tester.pump();
  });
}
