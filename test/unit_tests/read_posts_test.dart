import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web_clean_arch/core/error/exceptions.dart';
import 'package:flutter_web_clean_arch/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:flutter_web_clean_arch/features/posts/data/models/post_model.dart';
import 'package:flutter_web_clean_arch/features/posts/domain/entities/post.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'read_posts_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('Fetch Posts', () {
    test('Fetch posts successfully', () async {
      final client = MockClient();

      when(client.get(
        Uri.parse(BASE_URL + "/posts/"),
        headers: {"Content-Type": "application/json"},
      )).thenAnswer((_) async => http.Response('Deleted', 200));

      expect(await PostRemoteDataSourceImpl(client: client).getAllPosts(),
          isA<List<PostModel>>());
    });

    test('throws an exception while fetching posts', () async {
      final client = MockClient();

      when(client.get(
        Uri.parse(BASE_URL + "/posts/"),
        headers: {"Content-Type": "application/json"},
      )).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(PostRemoteDataSourceImpl(client: client).getAllPosts(),
          throwsException);
    });
  });
}
