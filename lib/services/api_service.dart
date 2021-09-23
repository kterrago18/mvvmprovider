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
}
