import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
 
 final List<ImageModel> images;

   ImageList(this.images);

   Widget build(BuildContext context){
     return ListView.builder(
       padding: const EdgeInsets.all(8),
      itemCount: images.length,
       itemBuilder:(context, int index){
          return buildImage(images[index]);
       }     
     );
   }
  
 Widget buildImage(ImageModel image){
   return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.cyan),
            ),
            margin: EdgeInsets.all(15.0),
            padding: EdgeInsets.all(15.0),
            child: Column( 
              children: <Widget>[
                Padding(
                  child:Image.network(image.url),
                  padding: EdgeInsets.only(
                    bottom: 7
                    ),
                ),               
                Text(image.title)
              ],
            ),
          );
  }
}