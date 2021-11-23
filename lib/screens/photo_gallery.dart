import 'package:first_full_app/helper/custom_appbar.dart';
import 'package:first_full_app/screens/full_image.dart';
import 'package:flutter/material.dart';

List<String> imageList=[
  "assets/image/ict1.jpg",
  "assets/image/ict2.jpg",
  "assets/image/ict3.jpg",
  "assets/image/ict4.jpg",
  "assets/image/ict5.jpg",
  "assets/image/ict6.jpg",
  "assets/image/ict7.jpg"
];
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
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1,
          children: imageList.map((item){
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute
                    (builder: (context)=>FullImageShow(imageLink: item)));
                },
                child: AnimatedContainer(
                  height: 90,
                    width: 90,
                    duration: Duration(milliseconds: 1000),
                    child: Image.asset(item,
                      fit: BoxFit.cover,)
                ),
              ),
            );
          }).toList(),
        )
      ),
    );
  }
}
