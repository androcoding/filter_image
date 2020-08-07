import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import './image_model.dart';

class ImageList extends StatefulWidget {
  ImageList({Key key}) : super(key: key);

  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  List<ImageModel> images = [];
  void initState() {
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    return images.length == 0 ? loadingIndicator() : imageList();
  }
   Widget loadingIndicator() {
    getImages();
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  Widget imageList() {
    return RefreshIndicator(
        child: ListView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) {
              final imagesData = images[index];
              return Card(
                margin: EdgeInsets.all(10.0),
                elevation: 4.0,
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0)),
                      child: Image.network(imagesData.url),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10.0),
                    ),
                    Padding(
                      child: Text(
                        imagesData.title,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                      ),
                      padding: EdgeInsets.all(20.0),
                    ),
                  ],
                ),
              );
            }),
        onRefresh: getImages);
  }


  Future<void> getImages() async {
    var response = await get(
        "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1");
    if (response.statusCode == 200) {
      final map = json.decode(response.body);
      final imageJson = map["items"];
      imageJson.forEach((image) {
        final imageM = ImageModel.fromJson(image);
        setState(() {
          images.insert(0, imageM);
        });
      });
    }
  }
}
