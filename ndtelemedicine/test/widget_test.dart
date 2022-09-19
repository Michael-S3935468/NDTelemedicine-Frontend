import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ndtelemedicine/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that app name is correct.
    expect(find.text('NDTelemedicine'), findsOneWidget);
  });
}
