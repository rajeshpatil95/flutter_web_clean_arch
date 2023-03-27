import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web_clean_arch/main.dart' as app;

import '../../utils/helper.dart';

void main() async {
  group('Fetch posts Test', () {
    testWidgets('Successfully fetch posts', (WidgetTester tester) async {
      app.main();
      await Helper.pumpUntilFound(tester, find.text('Posts'));

      final addPostButton =
          find.widgetWithIcon(FloatingActionButton, Icons.add);
      final postTile = find.byType(ListTile);

      expect(addPostButton, findsOneWidget);
      expect(postTile, findsAtLeastNWidgets(1));
    });
  });
}
