import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvmprovider/components/post/post_viewmodel.dart';
import 'package:mvvmprovider/models/models.dart';

class PostView extends StatefulWidget {
  final Post post;

  const PostView({Key? key, required this.post}) : super(key: key);

  @override
  PostViewState createState() => PostViewState(post);
}

class PostViewState extends State<PostView> {
  Post post;
  PostViewModel? postViewModel;

  PostViewState(this.post) {
    postViewModel = PostViewModel();
    postViewModel!.setPost(post);
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        postViewModel!.post.id.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            postViewModel!.post.title.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            postViewModel!.post.body.toString(),
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
