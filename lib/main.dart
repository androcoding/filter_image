import 'package:flutter/material.dart';
import './app.dart';

void main() => runApp(FilterImage());

class FilterImage extends StatelessWidget {
  const FilterImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}
