import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_api/model/users_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Results> users = [];

  var url = 'https://randomuser.me/api/?results=20';

  fetchData() async {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var jsonBody = jsonDecode(res.body);
      var data = Users.fromJson(jsonBody);

      users = data.results;

      for (var i in users) {
        print(i.name.first);
      }

      return users;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Api'),
            centerTitle: true,
            backgroundColor: Colors.amber,
          ),
          body: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                            '${users[index].name.title} ${users[index].name.first} ${users[index].name.last}'),
                        subtitle: Text('${users[index].email}'),  
                        leading: CircleAvatar(backgroundImage: NetworkImage(users[index].picture.large),),
                      );
                    });
              }else{
                return Center(
                  child: Text('empty'),
                );
              }
            },
          )),
    );
  }
}
