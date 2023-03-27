import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web_clean_arch/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:flutter_web_clean_arch/features/posts/data/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_update_delete_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('Create/Update/Delete Post', () {
    test('Create posts successfully', () async {
      final mockClient = MockClient();
      const mockPostModel = PostModel(title: "Krishna Patil", body: "Goa");
      final mockBody = {
        "title": mockPostModel.title,
        "body": mockPostModel.body,
      };

      when(mockClient.post(Uri.parse(BASE_URL + "/posts/"), body: mockBody))
          .thenAnswer((_) async => http.Response(
              '{"userId": 101, "id": 101, "title": "Krishna Patil", "body": "Goa"}',
              201));

      expect(
          await PostRemoteDataSourceImpl(client: mockClient)
              .addPost(mockPostModel),
          isA<Unit>());
    });

    test('throws an exception while fetching posts', () async {
      final mockClient = MockClient();
      const mockPostModel = PostModel(title: "Krishna Patil", body: "Goa");
      final mockBody = {
        "title": mockPostModel.title,
        "body": mockPostModel.body,
      };

      when(mockClient.post(Uri.parse(BASE_URL + "/posts/"), body: mockBody))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(
          PostRemoteDataSourceImpl(client: mockClient).addPost(mockPostModel),
          throwsException);
    });

    test('Delete post successfully', () async {
      final mockClient = MockClient();
      const mockPostId = 1;

      when(mockClient.delete(
              Uri.parse(BASE_URL + "/posts/${mockPostId.toString()}"),
              headers: {"Content-Type": "application/json"}))
          .thenAnswer((_) async => http.Response('Deleted', 200));

      expect(
          await PostRemoteDataSourceImpl(client: mockClient)
              .deletePost(mockPostId),
          isA<Unit>());
    });

    test('throws an exception while deleting posts', () async {
      final mockClient = MockClient();
      const mockPostId = 1;

      when(mockClient.delete(
        Uri.parse(BASE_URL + "/posts/${mockPostId.toString()}"),
        headers: {"Content-Type": "application/json"},
      )).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(
          PostRemoteDataSourceImpl(client: mockClient).deletePost(mockPostId),
          throwsException);
    });

    test('Update post successfully', () async {
      final mockClient = MockClient();
      const mockPostModel =
          PostModel(id: 1, title: "Krishna Patil", body: "Goa");

      final mockBody = {
        "title": mockPostModel.title,
        "body": mockPostModel.body,
      };

      when(mockClient.patch(
        Uri.parse(BASE_URL + "/posts/${mockPostModel.id.toString()}"),
        body: mockBody,
      )).thenAnswer((_) async => http.Response(
          '{"userId": 1, "id": 1, "title": "Krishna Patil", "body": "Goa"}',
          200));

      expect(
          await PostRemoteDataSourceImpl(client: mockClient)
              .updatePost(mockPostModel),
          isA<Unit>());
    });

    test('throws an exception while update posts', () async {
      final mockClient = MockClient();
      const mockPostModel =
          PostModel(id: 1, title: "Krishna Patil", body: "Goa");

      final mockBody = {
        "title": mockPostModel.title,
        "body": mockPostModel.body,
      };

      when(mockClient.patch(
        Uri.parse(BASE_URL + "/posts/${mockPostModel.id.toString()}"),
        body: mockBody,
      )).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(
          PostRemoteDataSourceImpl(client: mockClient)
              .updatePost(mockPostModel),
          throwsException);
    });
  });
}
