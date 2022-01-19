import 'package:first_full_app/helper/menu_widget.dart';
import 'package:first_full_app/model/flower_model.dart';
import 'package:first_full_app/provider/employee_provider.dart';
import 'package:first_full_app/screens/about_us.dart';
import 'package:first_full_app/screens/employees.dart';
import 'package:first_full_app/screens/photo_gallery.dart';
import 'package:first_full_app/screens/quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


GlobalKey<SliderMenuContainerState> _key =
new GlobalKey<SliderMenuContainerState>();
String title= "Home";

final List<String> imgList = [
 "assets/image/ict1.jpg",
 "assets/image/ict2.jpg",
 "assets/image/ict3.jpg",
 "assets/image/ict4.jpg",
 "assets/image/ict5.jpg",
 "assets/image/ict6.jpg",
 "assets/image/ict7.jpg",
 "assets/image/ict8.jpg"
  ];

Confidential cData=Confidential();

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<EmployeeProvider>
      (context,listen: false).initializeSpecialEmployee();
    double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;
    return Scaffold(
      body:
      SliderMenuContainer(
        appBarColor: Colors.teal,
        key: _key,
        sliderMenuCloseSize: 0,
        title: Text("HOME",style: TextStyle(color: Colors.white,
            fontSize: width*0.055,fontWeight: FontWeight.w800),),
        shadowColor: Colors.transparent,
        drawerIconColor: Colors.white,
        drawerIconSize: width*0.08,
        //slideDirection: Slider.RIGHT_TO_LEFT,
        //appBarPadding: const EdgeInsets.only(top: 10),
        sliderMenuOpenSize: 280,
        appBarHeight: 100,
        appBarPadding: EdgeInsets.fromLTRB(0, 40, 0, 0),
        sliderMenu:
        MenuWidget(
          //  onProfilePictureClick: () {},
          onItemClick: (title) {
            _key.currentState!.closeDrawer();
            setState(() {
              title = title;
              if(title=="HOME")
              {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder:
                //       (context) => MyHomePage()),
                // );
              }
              else if(title=="PHOTO GALLERY")
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:
                      (context) => PhotoGallery()),
                );
              }
              else if(title=="EMPLOYEES")

              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:
                      (context) => Employees()),
                );
              }
              else if(title=="QUIZ")
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:
                      (context) => Quiz()),
                );
              }
              else if(title=="ABOUT US")
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:
                      (context) => AboutUs()),
                );
              }
            });
          },
        ),
        sliderMain:
        Column(
          children: [
            Consumer<EmployeeProvider>(
              builder: (context,empProvider,child){
                return Column(
                  children: [
                    Container(
                      height: height/3.8,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                        ),
                        items: imgList
                            .map((item) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(

                            width: width/1.2,
                            child: Image.asset(item,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ))
                            .toList(),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 16/13,
                          viewportFraction: 1.0,
                          autoPlay: true,
                        ),
                        items:
                        empProvider.employeeSpecialList
                        .map((index) =>
                            Container(
                         // height: 600,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.5,
                                            color: Colors.black
                                        )
                                    ),
                                     height: 130,
                                     width: 110,
                                    child: Image.asset(index.image,
                                    fit: BoxFit.cover,),
                                  ),
                                  Text(
                                  index.name,style: TextStyle
                                    (fontSize: 18,
                                      color: Colors.white,fontWeight:
                                  FontWeight.bold),),
                                  Text(index.degi,maxLines:2,style:
                                  TextStyle(fontSize: 14,
                                      color: Colors.white,fontWeight:
                                      FontWeight.bold),),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0,bottom: 8,
                                    left: 20,right: 20),
                                    child: Container(
                                      //height: 110,
                                      child: Text(index.comment,
                                        textAlign: TextAlign.justify,
                                        maxLines:8,style:
                                      TextStyle(fontSize: 13,
                                          color: Colors.white),),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        )
                            .toList(),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap:(){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder:
                        (context) => Quiz()));
                     },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 3,
                              color: Colors.black
                          ),
                          color: Colors.blue.shade100,
                        ),
                        height: 90,
                        width: 140,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/gif/quiz.gif"),
                        ),
                      ),
                    ),

                  ],
                );
              }
            ),
          ],
        )
      ),
    );
  }
}
