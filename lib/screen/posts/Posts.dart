import 'package:flutter/material.dart';

import '../../api/fetchPosts.dart';
import '../../listitem/postitem.dart';
import '../../model/post.dart';

class posts extends StatefulWidget {
  const posts({Key? key}) : super(key: key);

  @override
  State<posts> createState() => _PostsState();
}

class _PostsState extends State<posts> {
  List<post> _posts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPosts().then((posts) {
      setState(() {
        _posts = posts;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(), // display loading indicator
            )
          : Container(
            height: double.infinity,
            child: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (BuildContext context, int index) {
                return postitem(_posts[index].title!, _posts[index].body!);
              },
            ),
          ),
      // ListView(
      //   children: <Widget>[
      //     Container(
      //       height: 160.0,
      //       color: Colors.red,
      //     ),
      //     Container(
      //       height: 160.0,
      //       color: Colors.blue,
      //     ),
      //     Container(
      //       height: 160.0,
      //       color: Colors.green,
      //     ),
      //     Container(
      //       height: 160.0,
      //       color: Colors.yellow,
      //     ),
      //     Container(
      //       height: 160.0,
      //       color: Colors.orange,
      //     ),
      //   ],
      // )
    );
  }
}
