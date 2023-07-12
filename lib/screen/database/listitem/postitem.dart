


import 'package:flutter/material.dart';

import '../../posts/postdetail.dart';




class postitem extends StatelessWidget {
  final String title;
  final String content;

  postitem(this.title,this.content);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => postdetail(title,content)),
          );
        },
        child: Column(
          children: [
            Container(child: Text(title),padding: EdgeInsets.all(5),),
            Container(child: Text(content),margin: EdgeInsets.only(top: 5),padding: EdgeInsets.all(5),)
          ]
        ),
      ),
    );
  }
}
