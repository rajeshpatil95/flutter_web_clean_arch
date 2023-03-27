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

      await createUpdateDelete.clickFloatingButton();
      await Helper.pumpUntilFound(tester, find.text('Add Post'));
      await createUpdateDelete.enterTitle(title: 'Rajesh Patil');
      await createUpdateDelete.enterBody(body: 'Bangalore');
      await createUpdateDelete.clickAddEditDeletePostButton('Add');
      await Helper.pumpUntilFound(tester, find.text('Post Added Successfully'));
    });

    testWidgets('Successfully UPDATE post test', (WidgetTester tester) async {
      app.main();
      await Helper.pumpUntilFound(tester, find.text('Posts'));

      final createUpdateDelete = CreateUpdateDelete(tester);

      await createUpdateDelete.clickPostTile();
      await Helper.pumpUntilFound(tester, find.text('Post Detail'));
      await createUpdateDelete.clickAddEditDeletePostButton('Edit');
      await Helper.pumpUntilFound(tester, find.text('Edit Post'));
      await createUpdateDelete.clickAddEditDeletePostButton('Update');
      await Helper.pumpUntilFound(
          tester, find.text('Post Updated Successfully'));
    });

    testWidgets('Successfully DELETE post test', (WidgetTester tester) async {
      app.main();
      await Helper.pumpUntilFound(tester, find.text('Posts'));

      final createUpdateDelete = CreateUpdateDelete(tester);

      await createUpdateDelete.clickPostTile();
      await Helper.pumpUntilFound(tester, find.text('Post Detail'));
      await createUpdateDelete.clickAddEditDeletePostButton('Delete');
      await Helper.pumpUntilFound(
          tester, find.widgetWithText(AlertDialog, 'Are you sure ?'));
      await tester.tap(find.widgetWithText(TextButton, 'Yes'));
      await Helper.pumpUntilFound(
          tester, find.text('Post Deleted Successfully'));
    });
  });
}
