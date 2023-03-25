import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web_clean_arch/main.dart' as app;

import '../../utils/helper.dart';

void main() async {
  group('Fetch all posts Test', () {
    testWidgets('Successfully fetch all posts', (WidgetTester tester) async {
      app.main();
      await Helper.pumpUntilFound(tester, find.text('Posts'));
    });

    testWidgets('fetching posts failed', (WidgetTester tester) async {});
  });
}
