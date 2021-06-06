import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/entity/Photo.dart';
import 'package:gallery/screen/photo_detail_screen.dart';
import 'package:loadmore/loadmore.dart';

class PhotosGalleryScreen extends StatefulWidget {
  const PhotosGalleryScreen({Key? key, required List<Photo> photos})
    : _photos = photos, super(key: key);

  final List<Photo> _photos;

  @override
  _PhotosGalleryScreenState createState() => _PhotosGalleryScreenState();
}

class _PhotosGalleryScreenState extends State<PhotosGalleryScreen> {
  late List<Photo> _photos;
  List<Photo> displayList = [];
  int index = 0;
  ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _photos = widget._photos;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Photos Gallery',
          )
        )
      ),
      body: Container(
        child: buildGrid(_photos, context),
      ),
    );
  }
}

List<Widget> _buildGridTileList(List<Photo> photos, BuildContext context) {
  final List<Widget> tiles = <Widget>[];
  for (int i = 0; i < photos.length; i++) {
    tiles.add(new GridTile(
        child: new InkResponse(
          enableFeedback: true,
          child: new Image.network(
            photos[i].src.small,
            fit: BoxFit.cover,
          ),
          onTap: () => _onTileClicked(photos[i], context),
        )));
  }
  return tiles;
}

void _onTileClicked(Photo photo, BuildContext context){
  Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => PhotoDetailScreen(
              photo: photo
          )
      )
    );
}

Widget buildGrid(List<Photo> photos, BuildContext context) {
  return GridView.extent(
      maxCrossAxisExtent: 400,
      childAspectRatio: 4/2.5,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      padding: const EdgeInsets.all(1.0),
      children: _buildGridTileList(photos, context));
}

