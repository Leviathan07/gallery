import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery/entity/Photo.dart';
import 'package:gallery/screen/photos_gallery_screen.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black12,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),
              SizedBox(height: 16.0),
              Text(
                'Photos Gallery',
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 26,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                  onPressed: () async {
                    final response = await http.get(
                      Uri.parse('https://api.pexels.com/v1/search?query=nature&page=1&per_page=20'),
                      // Send authorization headers to the backend.
                      headers: {
                        HttpHeaders.authorizationHeader: '563492ad6f91700001000001e5c7b82186aa4c87a4c428e3cb027ea5',
                      },
                    );
                    final responseJson = jsonDecode(response.body);
                    print(responseJson['photos'][1]['photographer']);
                    var photos = (responseJson['photos'] as List).map((item) => Photo.fromJson(item)).toList();

                    if (photos != null) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => PhotosGalleryScreen(
                              photos: photos
                            )
                        )
                      );
                    }
                  },
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    'Click here to get photos',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}