import 'package:filter_image/image_list.dart';
import 'package:flutter/material.dart';
import './image_model.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<ImageModel> image = [];

  List images;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Filter Image',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Filter Image"),
        ),
        body: ImageList(),
      ),
    );
  }
}
