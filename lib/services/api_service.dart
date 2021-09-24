import 'dart:convert';

import 'package:mvvmprovider/models/models.dart';
import 'package:mvvmprovider/notifiers/post_notifier.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String API_ENDPOINT =
      "https://jsonplaceholder.typicode.com/posts";

  static getPosts(PostNotifier postNotifier) async {
    var postList = <Post>[];

    http.get(Uri.parse(API_ENDPOINT)).then((response) {
      print('## Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        print('## Response body: ${response.body}');
      }

      List posts = jsonDecode(response.body);
      posts.forEach((element) {
        postList.add(Post.fromMap(element));
      });

      print('## ${postList.length}');
      postNotifier.setPostList(postList);
    });
  }

  static Future<bool> addPost(Post post, PostNotifier postNotifier) async {
    print("addPost");
    bool result = false;
    await http
        .post(Uri.parse(API_ENDPOINT),
            headers: {"Content-type": "application/json; charset=UTF-8"},
            body: json.encode(post.toMap()))
        .then((response) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        print("successful");
        result = true;
        postNotifier.addPostToList(post);
      }
    });

    return result;
  }
}
