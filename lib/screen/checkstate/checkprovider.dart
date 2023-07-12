import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/provider/fetchDataProvider.dart';

import '../posts/postdetail.dart';

class checkprovider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<fetchDataProvider>(context);
    postProvider.fetchPosts();
    return Scaffold(
      appBar: AppBar(
        title: Text('PostswithProvider'),
      ),
      body: postProvider.posts.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: postProvider.posts.length,
        itemBuilder: (context, index) {
          final post = postProvider.posts[index];
          return ListTile(
            title: Text(post.title!),
            subtitle: Text(post.body!),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => postdetail(post.title!!,post.body!!)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => postProvider.fetchPosts(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
