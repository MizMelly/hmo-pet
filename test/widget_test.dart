// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:simba_app/main.dart';

void main() {
  testWidgets('Launches home and navigates after login', (WidgetTester tester) async {
    await tester.pumpWidget(SimbaApp());
    expect(find.textContaining('Healthcare for pets'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);

    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    expect(find.text('Create account'), findsOneWidget);

    // Simulate navigation to login
    await tester.ensureVisible(find.text('Already have an account? Sign in'));
    await tester.tap(find.text('Already have an account? Sign in'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome back'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).first, 'you@example.com');
    await tester.enterText(find.byType(TextFormField).last, 'password123');

    await tester.ensureVisible(find.byKey(const Key('login_submit')));
    await tester.tap(find.byKey(const Key('login_submit')));
    await tester.pumpAndSettle();

    expect(find.text('Overview'), findsOneWidget);
    expect(find.text('Recent activity'), findsOneWidget);
  });
}
