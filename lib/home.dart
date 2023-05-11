import 'package:flutter/material.dart';
import 'package:test/screen/news/News.dart';

import 'package:test/screen/posts/Posts.dart';
import 'package:test/sharepref/SharePref.dart';

import 'main.dart';
import 'model/news.dart';


class home extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Posts'),
            actions: [
              IconButton(onPressed: (){
                removedata();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => TestApp()),
                  (route) => false,
                );
              }, icon: Icon(Icons.logout))
            ],
          ),
          body: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => posts()),
                      );
                    },
                    child: Text("Posts")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => News()),
                      );
                    },
                    child: Text("News")),
              ],
            ),
          )
          // SingleChildScrollView(
          //            child: Column(
          //            children:[
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: _posts.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       //  final post = _posts[index];
          //       return ListTile(
          //         title: Text(_posts[index].title!),
          //         subtitle: Text(_posts[index].body!),
          //       );
          //     },
          //   ),
          // ),
          //   ListView(children: [Text("Hello")]),
          // ElevatedButton(onPressed: () {Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => posts()),
          // );}, child: Text("Posts")),

          //  Container(
          //    height: double.infinity,
          //      child: ListView.builder(
          //        itemCount: _posts.length,
          //        itemBuilder: (BuildContext context, int index) {
          //          return postitem(_posts[index].title!,_posts[index].body!);
          //        },
          //      ),
          // //  child: Text("Hello"),
          //  ),
          //          ]
          //  ),
          // )
          ),
    );
  }
}
