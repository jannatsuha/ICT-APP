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
    Provider.of<EmployeeProvider>(context,listen: false).initializeAllEmployee();
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
        sliderMenuOpenSize: 600,
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
        Consumer<EmployeeProvider>(
          builder: (context,empProvider,child){
            return SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                    ),
                    items: imgList
                        .map((item) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: height/4.5,
                        width: width/1.2,
                        child: Image.asset(item,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))
                        .toList(),
                  ),

                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                    ),
                    items: empProvider.employeeModelList
                        .map((item) => Container(
                          height: height/2,
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                child: Image.asset(item.image),
                              ),
                              // Text(item.name,style: TextStyle
                              //   (fontSize: 18,
                              //     color: Colors.white),),
                              // Text(item.degi,maxLines:2,style:
                              // TextStyle(fontSize: 14,
                              //     color: Colors.white),),
                              Container(
                                height: 100,
                                child: Text(item.comment,maxLines:6,style:
                                TextStyle(fontSize: 14,
                                    color: Colors.white),),
                              ),
                            ],
                          ),
                        ))
                        .toList(),
                  ),
                ],
              ),
            );
          }
        )
      ),
    );
  }
}
