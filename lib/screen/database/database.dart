// ignore_for_file: must_be_immutable



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/database/HiveProvider.dart';
import 'package:test/database/UserModel.dart';

class database extends StatefulWidget {
  const database({Key? key}) : super(key: key);

  @override
  State<database> createState() => _databaseState();
}

class _databaseState extends State<database> {

  final titlecontroller = TextEditingController();
  final contentcontroller = TextEditingController();

  // List<int> items= List<int>.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    HiveProvider dataProvider = Provider.of<HiveProvider>(context);
    dataProvider.getUserLists();
    List<UserModel> allData =  dataProvider.data;
    // List<int> item= List<int>.generate(100, (index) => index);
    return Consumer<HiveProvider>(builder: (context, dataProvider, child){
    return Scaffold(
      appBar: AppBar(
        title: Text("Database"),
      ),
      body:ListView.builder(
        itemCount: allData.length,
        itemBuilder: (context, index) {
          return Dismissible(
              key: ValueKey<int>(index),
               // key : UniqueKey(),
              //   key: Key(items[index].toString()),
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              confirmDismiss: (DismissDirection direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Remove Gift"),
                      content: const Text("Are you sure you want to remove this item?"),
                      actions: <Widget>[
                        ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text("Yes")),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text("No"),
                        ),
                      ],
                    );
                  },
                );
              },
              onDismissed: (direction) {

                //delete data in database
                dataProvider.deleteUser(index);

                /** clear data after delete
                 * Don't Remove and removeAt it can be error just clear and reFetch data from database**/
                dataProvider.data.clear();
              },
          child: GestureDetector(
            child: ListTile(
              title: Text("Username ${allData[index].username}"),
              subtitle: Text("Password ${allData[index].password}"),
              onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Really"),
                        content: const Text("Are you sure you want to remove this item?"),
                        actions: <Widget>[
                          ElevatedButton(
                              onPressed: (){
                                  dataProvider.deleteUser(index);
                                  Navigator.of(context).pop(true);
                                   },
                              child: const Text("Yes")
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text("No"),
                          ),
                        ],
                      );
                    },
                  );
              },
            ),
          ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat ,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context,
            builder: (BuildContext context)
            {
              return AlertDialog(
                title: Text('Add to database'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titlecontroller,
                      decoration: InputDecoration(labelText: 'Input username'),
                    ),
                    TextField(
                      controller: contentcontroller,
                      decoration: InputDecoration(labelText: 'Input email'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            child: Text('Cancel'),
                            onPressed: () async {
                              Navigator.of(context).pop();
                            },
                          ),
                          ElevatedButton(
                            child: Text('OK'),
                            onPressed: () {
                              final data=UserModel( username: titlecontroller.text, password: contentcontroller.text);
                              dataProvider.addUser(data);
                              titlecontroller.text='';
                              contentcontroller.text='';
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add)
      )
    );}
    );
  }
}

