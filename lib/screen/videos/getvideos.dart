
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test/permissionrequest/requestpermission.dart';

class getVideos extends StatefulWidget {
  const getVideos({Key? key}) : super(key: key);

  @override
  State<getVideos> createState() => _getVideosState();
}

class _getVideosState extends State<getVideos> {
  List<FileSystemEntity> _files = [];

  @override
  void initState() {
    super.initState();
    retrieveVideos() ;

  }
  void _getFiles() async {
    final directory = await getExternalStorageDirectory();
    List<FileSystemEntity> files = directory!.listSync().where((entity) => entity.path.endsWith('.mp4')).toList();
    print(files.length);
    setState(() {
      _files = files!;
    });
  }
  void retrieveVideos() async {
    Future<bool> data = requestStoragePermission();
    if(await data){
      print("Access");
     _getFiles();
     print(_files.length);
    }else{
      requestPermission();
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All videos"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Bottom Sheet'),
          onPressed: () {
            // requestPermission();
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: double.infinity,
                  child: Container(

                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.photo),
                          title: Text('Choose from Photos'),
                          onTap: () {
                            // Handle action
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.camera),
                          title: Text('Take a Photo'),
                          onTap: () {
                            // Handle action
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.note),
                          title: Text('Write a Note'),
                          onTap: () {
                            // Handle action
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
