import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gallery/entity/Photo.dart';

class PhotoDetailScreen extends StatefulWidget {
  const PhotoDetailScreen({Key? key, required Photo photo})
      : _photo = photo, super(key: key);

  final Photo _photo;

  @override
  _PhotoDetailScreenState createState() => _PhotoDetailScreenState();
}

class _PhotoDetailScreenState extends State<PhotoDetailScreen> {
  late Photo _photo;

  @override
  void initState() {
    _photo = widget._photo;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: Text(
          'Photo Detail'
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(),
              Image.network(
                _photo.src.original,
                fit: BoxFit.scaleDown,
                width: 300,
              ),
              SizedBox(height: 8.0),
              Text(
                'ID: ' + _photo.id,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Author: ' + _photo.photographer,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}