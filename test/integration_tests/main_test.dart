import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'tests/posts/read_posts_test.dart' as read_post_test;
import 'tests/posts/create_update_delete_post_test.dart'
    as create_update_delete_post_test;

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Complete BICS E2E test', () {
    setUp(() {});

    setUpAll(() {});

    tearDown(() {});

    tearDownAll(() {});

    read_post_test.main();
    create_update_delete_post_test.main();
  });
}
