import 'package:first_full_app/helper/custom_appbar.dart';
import 'package:flutter/material.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({Key? key}) : super(key: key);

  @override
  _PhotoGalleryState createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
          child: CustomAppBar(titile: 'Photo Gallery',)
      )
    );
  }
}
