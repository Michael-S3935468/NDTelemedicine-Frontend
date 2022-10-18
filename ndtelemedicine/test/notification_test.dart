import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ndtelemedicine/main.dart';
import 'package:ndtelemedicine/notifications/notification_page.dart';


void main() {
    // Test to check if title text 'Recent Notifications' loads in Notification Page
    testWidgets('Testing Title', (WidgetTester tester) async {
      await tester.pumpWidget(const NotificationPage());
      final titleFinder = find.text('Recent Notifications');
      expect(titleFinder, findsOneWidget);
    });

    // Test check if functionality and buttons for the Info button work
    testWidgets('Testing Help/Info Button', (WidgetTester tester) async {
      await tester.pumpWidget(const NotificationPage());
      await tester.tap(find.byIcon(Icons.info));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.info), findsOneWidget);
      expect(find.byIcon(Icons.swipe_outlined), findsOneWidget);
      expect(find.text('Swipe to dismiss notifications'), findsOneWidget);
    });

    // Testing to check if a notification list is loaded
    testWidgets('Testing Notification List', (WidgetTester tester) async {
      int minNotifs = 1;
      await tester.pumpWidget(const NotificationPage());
      final notificationFinder = find.widgetWithText(ListTile, 'Appointment');
      expect(notificationFinder, findsAtLeastNWidgets(minNotifs));
    });

    // Check if you can return to previous page (home page) via the home icon
    testWidgets('Testing Back(Home) Button', (WidgetTester tester) async {
      await tester.pumpWidget(const NotificationPage());
      await tester.tap(find.byIcon(Icons.home));
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsOneWidget);
    });
}