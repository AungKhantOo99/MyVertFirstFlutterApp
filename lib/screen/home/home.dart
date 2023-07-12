import 'package:flutter/material.dart';
import 'package:test/screen/checkstate/checkprovider.dart';
import 'package:test/screen/database/database.dart';
import 'package:test/screen/news/News.dart';

import 'package:test/screen/posts/Posts.dart';
import 'package:test/screen/videos/getvideos.dart';
import 'package:test/sharepref/SharePref.dart';

import '../../main.dart';




class home extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            leading:IconButton(
              icon: Icon(Icons.settings),
              onPressed: (){
                print("object");
              },
            ),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => posts()),
                      );
                    },
                    child: Text("Get Posts simple method")),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => News()),
                        );
                      },
                      child: Text("Get News simple method")),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => checkprovider()),
                        );
                      }, child: Text("Get post with provider")),
                ),
                // Container(
                //   margin: EdgeInsets.only(top: 20),
                //   child: ElevatedButton(
                //       onPressed: (){
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(builder: (context) => getVideos()),
                //         );
                //       }, child: Text("Get Video data")),
                // ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => database()),
                        );
                      }, child: Text("See All database")),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
              type: BottomNavigationBarType.fixed,
              items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),

            ]
          ),
          );
  }
}
