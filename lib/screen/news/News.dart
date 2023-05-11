


import 'package:flutter/material.dart';
import 'package:test/api/fetchNews.dart';
import 'package:test/listitem/newsitem.dart';
import 'package:test/model/news.dart';

import '../../listitem/postitem.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _newsState();
}

class _newsState extends State<News> {

  List<Articles> _news = [];
  bool _isLoading = true;

  
  @override
  void initState() {
    super.initState();
    fetchNews().then((value) {
      setState(() {
     //   List<Articles> data=value.map((e) => Articles.fromJson(e)).toList();
        _news=value;
        _isLoading=false;
        print("DATA IS  ${_news}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News"),),
      body: _isLoading
        ? Center(
        child: CircularProgressIndicator(), // display loading indicator
    )
     :
      // ListView.builder(
      //       itemCount: _news.length,
      //       itemBuilder: (BuildContext context, int index) {
      //          String? title = _news[index].title;
      //          String? content = _news[index].content;
      //          if(title==null){
      //            title="There has no title";
      //          }
      //          if(content==null){
      //            content="No contents";
      //          }
      //          return ListTile(
      //              title: Text(title),
      //              subtitle: Text(content!),
      //            );
      //       },
      // ),
      Container(
        height: double.infinity,
        child: ListView.builder(
          itemCount: _news.length,
          itemBuilder: (BuildContext context, int index) {
                     // String? title = _news[index].title;
                     // String? content = _news[index].content;
                     // String? image=_news[index].urlToImage;
                     // Source? source=_news[index].source;
                     // String? date=_news[index].publishedAt;
                     // String? url=_news[index].url;
                     // if(url==null){
                     //   url='www.google.com';
                     // }
                     // if(date==null){
                     //   date="Unknown date";
                     // }
                     // if(title==null){
                     //   title="There has no title";
                     // }
                     // if(content==null){
                     //   content="No contents";
                     // }
                     // if(image==null){
                     //   image='https://img.lovepik.com/photo/20211122/small/lovepik-simple-home-picture_500717659.jpg';
                     // }
                   Articles? data=_news[index];
            return newsitem(data);
          },
        ),
      ),
    );
  }
}


