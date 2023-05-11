

import 'package:flutter/material.dart';

class postdetail extends StatelessWidget {
 final String title;
 final String content;

 postdetail(this.title,this.content);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text("Post Details"),),
     body: Column(
      children: [
       Container(
        child: Text(title),
       ),
       Container(
        margin: EdgeInsets.only(top: 75),
        child: Text(content),
       )
      ],
     ),
    );
  }
}
