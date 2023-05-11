

import 'package:shared_preferences/shared_preferences.dart';

savedata(String valid) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('valid', valid);
}


Future<String?> getString() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String stringValue = prefs.getString('valid')?? 'nodata';
  return stringValue;
}

removedata() async{
  SharedPreferences prefs= await SharedPreferences.getInstance();
  prefs.remove('valid');
}