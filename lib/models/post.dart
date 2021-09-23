import 'dart:convert';

Post postFromMap(String str) => Post.fromMap(json.decode(str));

String postToMap(Post data) => json.encode(data.toMap());

class Post {
  Post({
    this.id,
    this.userId,
    this.body,
    this.title,
  });

  int? id;
  int? userId;
  String? body;
  String? title;

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        id: json["id"],
        userId: json["userId"],
        body: json["body"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "userId": userId,
        "body": body,
        "title": title,
      };
}
