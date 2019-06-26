//import fluttter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import './widgets/image_list.dart';
//create a class that will be our custom widget
//this class must extend the Stateless Widget base class

class App extends StatefulWidget {
  createState() {
    return _App();
  }
}

class _App extends State<App> {
  int counter = 0;
  
  List<ImageModel> images  =[];
  
  void fetchImage() async {
    counter ++;
    var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    
    setState(() {
     images.add(imageModel); 
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
        appBar: AppBar(title: Text('Photo')),
      ),
    );
  }
}

//must define a 'build' method that returns
//the widgets that *this widget will show
