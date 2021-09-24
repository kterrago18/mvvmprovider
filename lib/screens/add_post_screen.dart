import 'package:flutter/material.dart';
import 'package:mvvmprovider/models/models.dart';
import 'package:mvvmprovider/notifiers/post_notifier.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State createState() {
    return AddPostScreenSate();
  }
}

class AddPostScreenSate extends State<AddPostScreen> {
  final _formKey = GlobalKey<FormState>();
  final _post = Post();

  _showSnackBar(String text, BuildContext context) {
    final snackbar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  _createPost(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      _showSnackBar("Failed to create Post", context);
      return;
    }
    _formKey.currentState!.save();
    _post.userId =
        1; // this is hard coded currently as we don't have authService

    PostNotifier postNotifier = Provider.of(context, listen: false);
    _post.id = postNotifier.getPostList().length + 1;
    postNotifier.uploadPost(_post).then((value) {
      if (value) {
        _showSnackBar("post added successfully", context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a Post"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Post title",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Post title cannot be empty';
                  }

                  if (value.length < 5 || value.length > 50) {
                    return 'Post title must be between 5 and 50 characters';
                  }
                  return null;
                },
                onSaved: (value) {
                  _post.title = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Post Body",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Post body cannot be empty';
                  }

                  if (value.length < 5 || value.length > 100) {
                    return 'Post body must be between 5 and 100 characters';
                  }
                  return null;
                },
                onSaved: (value) {
                  _post.body = value;
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
              child: TextButton(
                onPressed: () {
                  _createPost(context);
                },
                child: const Text('Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
