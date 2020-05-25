import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_django/pages/book_list.dart';
import '../services/search_service.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<dynamic> searchResults = [];

  searchDjango(value) async {
    SearchService.searchDjangoApi(value).then((responseBody) {
      String val = responseBody;
      List<dynamic> data = jsonDecode(val);
      setState(() {
        data.forEach((value) {
          searchResults.add(value);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Django API Search"),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (val) {
                  searchResults.clear();
                  searchDjango(val);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 25.0),
                  hintText: 'Search Book',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // initiate search on press
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: searchResults.length,
              itemBuilder: (BuildContext context, int index) {
                return buildResultCard(searchResults[index]);
              },
            ),
            FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BookList()));
              },
              child: Text("SEE ALL BOOKS"),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildResultCard(data) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: <Widget>[
        ListTile(
          title: Text(data['name']),
          subtitle: Text("Rs.${data['price']}"),
        ),
        Divider(color: Colors.black)
      ],
    ),
  );
}