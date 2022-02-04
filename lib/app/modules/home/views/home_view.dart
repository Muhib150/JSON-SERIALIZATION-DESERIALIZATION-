import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:jason/data/models/data.dart';

import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<User> datas = [];

  Future<List<User>> fetchdatas() async {
    var url = 'https://jsonplaceholder.typicode.com/todos/';
    var response = await http.get(Uri.parse(url));

    List<User> datas = [];
    if (response.statusCode == 200) {
      var datasJson = json.decode(response.body);
      for (var dataJson in datasJson) {
        datas.add(User.fomJson(dataJson));
      }
    }
    return datas;
  }

  @override
  void initState() {
    fetchdatas().then((value) {
      setState(() {
        datas.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('json'),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: datas.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 50, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'User ID: ',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${datas[index].userid}',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'ID: ',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${datas[index].id}',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Title: ',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${datas[index].title}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Completed: ',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${datas[index].complete}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
