


import 'dart:io';


import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


Future<bool> requestStoragePermission() async {
  var status = await Permission.storage.request();
  return status.isGranted;
}

Future<String> getStorageDirectoryPath() async {
  final directory = await getExternalStorageDirectory();
  return directory!.path;
}
Future<void> requestPermission() async {
  final status = await Permission.storage.request();
  if (status.isGranted) {
    // Permission granted, perform further operations
    print('Storage permission granted');
  } else if (status.isDenied) {
    // Permission denied, show a dialog or handle the denied state
    await Permission.storage.request();
  }
}



