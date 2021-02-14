import 'package:day_13_block_and_cubit/posts_cubic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'posts_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider<PostsCubit>(
            // '..' Dart's cascade notation operator
            create: (context) => PostsCubit()..getPosts(),
            child: PostsView()));
  }
}
