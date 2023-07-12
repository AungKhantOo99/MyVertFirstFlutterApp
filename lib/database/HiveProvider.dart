


import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'UserModel.dart';

class HiveProvider extends ChangeNotifier {
  List<UserModel> _data = [];
  late bool check ;
  List<UserModel> get data => _data;
  String hiveBox = 'hive_local_db';

  //Adding user model to hive db
   addUser(UserModel userModel) async {
    var box = await Hive.openBox(hiveBox); //open the hive box before writing
    var mapUserData = userModel.toMap(userModel);
    await box.add(mapUserData);
    Hive.close(); //closing the hive box
    notifyListeners();
  }

  //Reading all the users data
  getUserLists() async {
    var box = await Hive.openBox(hiveBox);
    List<UserModel> users = [];
    for (int i =0; i <=box.length - 1; i++) {
      var userMap = box.getAt(i);
      users.add(UserModel.fromMap(Map.from(userMap)));
    }
    _data=users;
     notifyListeners();
    // return users;
  }

  //check username and password for login
  Future<bool> checkValidation(String email,String credential) async {

     for(var element in data){
         print(element.username);
         print(element.password);
       if(element.username == email && element.password == credential){
         check=true;
         break;
       }else{
         check=false;
       }
     }
    // print("input $email");
    // print("input $credential");
    //
    //  data.forEach((element) {
    //    print(element.username);
    //    print(element.password);
    //    if(element.username == email && element.password == credential){
    //      check=true;
    //    }
    //  });

    return check;

  }

  //Deleting one data from hive DB
  deleteUser(int id) async {
    var box = await Hive.openBox(hiveBox);
    await box.deleteAt(id);
    // notifyListeners();
  }

  //Deleting whole data from Hive
  deleteAllUsers() async {
    var box = await Hive.openBox(hiveBox);
    await box.clear();
    notifyListeners();
  }
}