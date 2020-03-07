import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ViewImagePage extends StatelessWidget {
  final String imageUrl;

  const ViewImagePage({Key key, this.imageUrl}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(icon: Icon(Icons.close,color: Colors.white,),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: Container(
      
      child: PhotoView(
      imageProvider: NetworkImage(imageUrl)
    )
    ),
    );
  }
}