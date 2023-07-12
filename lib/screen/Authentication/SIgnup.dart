
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../database/HiveProvider.dart';
import '../../database/UserModel.dart';
import '../../sharepref/SharePref.dart';
import '../home/home.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

final _emailcontroller = TextEditingController();
final _passcontroller = TextEditingController();

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    HiveProvider dataProvider = Provider.of<HiveProvider>(context);
    return Scaffold(
        appBar: AppBar(title: Text("Hello")),
      body: Container(
        child: ListView(
          children: [
            Center(
              child: Container(
                width: 250,
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Enter Email"),
                  controller: _emailcontroller,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 250,
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Enter Password"),
                  controller: _passcontroller,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 25),
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    final data=UserModel( username: _emailcontroller.text, password: _passcontroller.text);
                    dataProvider.addUser(data);
                    savedata('valid');
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => home()),
                          (route) => false,
                    );
                  },
                  child: Text("Sign Up"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
