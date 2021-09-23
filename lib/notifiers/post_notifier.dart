import 'package:flutter/cupertino.dart';
import 'package:mvvmprovider/models/models.dart';
import 'package:mvvmprovider/services/api_service.dart';

class PostNotifier extends ChangeNotifier {
  var _postList = <Post>[];

  setPostList(List<Post> postList) {
    _postList = [];
    _postList = postList;
    notifyListeners();
  }

  List<Post> getPostList() => _postList;
}
