

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../network/model/news.dart';



class newsdetail extends StatelessWidget {
  Articles? data=Articles();
  List<String> createdate=[];
  newsdetail(this.data);

  @override
  Widget build(BuildContext context) {

    // Future<void> _launchURL(String url) async {
    //   if (await canLaunch(url)) {
    //     await launch(url);
    //   } else {
    //     throw 'Could not launch $url';
    //   }
    // }

    Future<void> _launchUrl(Uri url) async {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    if(data!.publishedAt!=null){
       createdate=data!.publishedAt!.split('T');
    }
    return Scaffold(
      appBar: AppBar(title: Text("News Details"),),
      body: SingleChildScrollView(
      //  scrollDirection: Axis.horizontal,
        child: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                child: Text(data!.title ?? 'Title',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'RobotoCondensed-Regular')),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 5),
                child: Text("-${data!.source!.name ?? 'Unknown'}-${createdate[0]}"),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Image.network(data!.urlToImage ?? 'https://img.lovepik.com/photo/20211122/small/lovepik-simple-home-picture_500717659.jpg'),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(data!.content ?? 'Null Contents'),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 30),
                child: Text('Author : ${data!.author}' ?? 'Author  : Unknown'),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Text('More Info : '),
                    InkWell(
                      onTap: (){
                        final url=Uri.parse(data!.url ?? 'www.google.com');
                        _launchUrl(url);
                        print("Tap");
                      },
                      child: Text('SeeMore',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
