import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _offset = 0;

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == null) {
      response = await http.get(
          "https://api.giphy.com/v1/gifs/trending?api_key=zU8GJK8W1k0OumyrulF0Fj9GAngcD8Rm&limit=20&rating=R");
    } else {
      response = await http.get(
          "https://api.giphy.com/v1/gifs/search?api_key=&q=$_search&limit=20&offset=$_offset&rating=R&lang=en");
    }

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();

    _getGifs().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network("https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              //controller: ,
              decoration: InputDecoration(
                  labelText: "Search here!",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder()
              ),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
