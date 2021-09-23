import 'package:flutter/material.dart';
import 'package:mvvmprovider/components/post/post_view.dart';
import 'package:mvvmprovider/notifiers/post_notifier.dart';
import 'package:mvvmprovider/services/api_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    PostNotifier postNotifier =
        Provider.of<PostNotifier>(context, listen: false);
    ApiService.getPosts(postNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var postNotifier = Provider.of<PostNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/add_post");
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: postNotifier != null
          ? Container(
              color: Colors.black12,
              child: ListView.builder(
                itemCount: postNotifier.getPostList().length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(0),
                  key: ObjectKey(postNotifier.getPostList()[index]),
                  child: PostView(post: postNotifier.getPostList()[index]),
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
