import 'package:flutter/material.dart';
import 'package:mvvmprovider/notifiers/post_notifier.dart';
import 'package:mvvmprovider/screens/add_post_screen.dart';
import 'package:mvvmprovider/screens/home_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PostNotifier(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVVM with Provider',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const HomeScreen(
        title: 'MVVM with Provider',
      ),
      routes: {
        "/add_post": (context) => const AddPostScreen(),
      },
    );
  }
}
