


import 'package:flutter/material.dart';

import '../../../network/model/news.dart';
import '../../news/newsdetail.dart';


class newsitem extends StatelessWidget {
   Articles? data=Articles();

  newsitem(this.data);

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
            MaterialPageRoute(builder: (context) => newsdetail(data)),
          );
        },
        child: Column(
            children: [
              Container(child: Text(data!.title ?? 'NULL'),padding: EdgeInsets.all(5),),
              Container(child: Image.network(data!.urlToImage ?? 'https://img.lovepik.com/photo/20211122/small/lovepik-simple-home-picture_500717659.jpg'),),
              SizedBox(width: double.infinity,height: 20)
            ]
        ),
      ),
    );
  }
}
