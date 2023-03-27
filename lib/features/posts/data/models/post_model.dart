import '../../domain/entities/post.dart';

class PostModel extends Post {
  const PostModel({int? id, required String title, required String body})
      : super(id: id, title: title, body: body);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        id: json['id'] ?? 0,
        title: json['title'] ?? "",
        body: json['body'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {'id': id ?? 0, 'title': title, 'body': body};
  }
}
