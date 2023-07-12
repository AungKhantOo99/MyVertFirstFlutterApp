
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/screen/home/home.dart';
import 'package:test/sharepref/SharePref.dart';


import '../../database/HiveProvider.dart';
import 'SIgnup.dart';

class homepresentationview extends StatefulWidget {
  const homepresentationview({Key? key}) : super(key: key);

  @override
  State<homepresentationview> createState() => _homeState();
}

class _homeState extends State<homepresentationview> {
  @override
  void initState() {
    super.initState();
    getString().then((value) {
      setState(() {
        String data=value?? 'nodata';
        if(data =='valid'){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => home()),
                (route) => false,
          );
        }
        print("Validation $data");
      });
    });
  }
  final _emailcontroller = TextEditingController();
  final _passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    HiveProvider dataProvider = Provider.of<HiveProvider>(context);
     dataProvider.getUserLists();
    return Scaffold(
      appBar: AppBar(
        title: Text("Test App"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white30,
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: 150),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      child: Text(
                        "Hello User",
                        style: TextStyle(fontSize: 24, color: Colors.indigo),
                      ),
                    ),
                  ),
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
                        onPressed: () async {
                          final validation = await dataProvider.checkValidation(_emailcontroller.text,_passcontroller.text);
                          if(validation){
                            savedata('valid');
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => home()),
                                  (route) => false,
                            );
                          }
                        },
                        child: Text("Login"),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: 250,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("For News Users?"),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Signup()),
                              );
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.indigo),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
