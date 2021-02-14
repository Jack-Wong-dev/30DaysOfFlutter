import 'package:day_13_block_and_cubit/posts_cubic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post.dart';

class PostsView extends StatefulWidget {
  @override
  _PostsViewState createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, List<Post>>(
      builder: (context, posts) {
        if (posts.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(posts[index].title),
              ),
            );
          },
        );
      },
    );
  }
}
