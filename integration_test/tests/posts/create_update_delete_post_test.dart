import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web_clean_arch/main.dart' as app;

import '../../features/posts/create_update_delete_post.dart';
import '../../utils/helper.dart';

void main() async {
  group('CREATE/UPDATE/DELETE post Test', () {
    testWidgets('Successfully CREATE post test', (WidgetTester tester) async {
      app.main();
      await Helper.pumpUntilFound(tester, find.text('Posts'));

      final createUpdateDelete = CreateUpdateDelete(tester);
      final addPostButton =
          find.widgetWithIcon(FloatingActionButton, Icons.add);
      await tester.tap(addPostButton);
      await Helper.pumpUntilFound(tester, find.text('Add Post'));

      await createUpdateDelete.enterTitle(title: 'Rajesh Patil');

      await createUpdateDelete.enterBody(body: 'Bangalore');

      await createUpdateDelete.clickAddPostButton();
      await Helper.pumpUntilFound(tester, find.text('Post Added Successfully'));
    });

    testWidgets(
        'Successfully UPDATE post test', (WidgetTester tester) async {});
    testWidgets(
        'Successfully DELETE post test', (WidgetTester tester) async {});
  });
}
