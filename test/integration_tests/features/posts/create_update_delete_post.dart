import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/helper.dart';

class CreateUpdateDelete {
  final WidgetTester tester;

  CreateUpdateDelete(this.tester);

  Future<void> clickPostTile() async {
    final postTile = find.byType(ListTile).first;
    await tester.tap(postTile);
  }

  Future<void> clickFloatingButton() async {
    final floatingButton = find.widgetWithIcon(FloatingActionButton, Icons.add);
    await tester.tap(floatingButton);
  }

  Future<void> enterTitle({String title = '', String hintText = ''}) async {
    final textFormFieldTitle = find.widgetWithText(TextFormField, hintText);
    await tester.tap(textFormFieldTitle);
    await tester.enterText(textFormFieldTitle, title);
    await Helper.enterDone(tester);
  }

  Future<void> enterBody({String body = '', String hintText = ''}) async {
    final textFormFieldBody = find.widgetWithText(TextFormField, hintText);
    await tester.tap(textFormFieldBody);
    await tester.enterText(textFormFieldBody, body);
    await Helper.enterDone(tester);
  }

  Future<void> clickAddEditDeletePostButton(String mode) async {
    final createProjectButtonFinder = find.ancestor(
        of: find.text(mode),
        matching: find.byWidgetPredicate(
            (widget) => '${widget.runtimeType}' == '_ElevatedButtonWithIcon'));
    await tester.tap(createProjectButtonFinder);
    await tester.pumpAndSettle();
  }
}
