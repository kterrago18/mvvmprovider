import 'package:flutter/cupertino.dart';
import 'package:mvvmprovider/models/models.dart';
import 'package:mvvmprovider/services/api_service.dart';

class PostNotifier extends ChangeNotifier {
  var _postList = <Post>[];

  addPostToList(Post post) {
    _postList.add(post);
    notifyListeners();
  }

  setPostList(List<Post> postList) {
    _postList = [];
    _postList = postList;
    notifyListeners();
  }

  List<Post> getPostList() => _postList;

  Future<bool> uploadPost(Post post) async {
    return await ApiService.addPost(post, this);
  }
}
