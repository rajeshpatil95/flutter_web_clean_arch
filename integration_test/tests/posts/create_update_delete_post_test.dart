import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group('CREATE/UPDATE/DELETE post Test', () {
    testWidgets(
        'Successfully CREATE post test', (WidgetTester tester) async {});
    testWidgets(
        'Successfully UPDATE post test', (WidgetTester tester) async {});
    testWidgets(
        'Successfully DELETE post test', (WidgetTester tester) async {});

    testWidgets('Failed to CREATE post test', (WidgetTester tester) async {});
    testWidgets('Failed to UPDATE post test', (WidgetTester tester) async {});
    testWidgets('Failed to DELETE post test', (WidgetTester tester) async {});
  });
}
