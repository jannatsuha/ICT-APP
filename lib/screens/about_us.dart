import 'package:first_full_app/provider/student_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<StudentProvider>(context).initializeAllStudent();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Student Details"),
        centerTitle: true,
      ),
      // body: Consumer<StudentProvider>(
      //     builder: (context,stdProvider,child){
      //       return Column(
      //         children: [
      //           Expanded(
      //             child: ListView.builder(
      //               itemCount: stdProvider.studentModelList.length,
      //                 itemBuilder: (context,index){
      //                   return Padding(
      //                     padding: const EdgeInsets.all(18.0),
      //                     child: Card(
      //                       child: Column(
      //                         children: [
      //                           Padding(
      //                             padding: const EdgeInsets.all(5.0),
      //                             child: Row(
      //                               mainAxisAlignment: MainAxisAlignment.center,
      //                               children: [
      //                                 Text("Name: ",
      //                                 style: TextStyle(
      //                                   color: Colors.teal,
      //                                   fontWeight: FontWeight.bold
      //                                 ),),
      //                                 Text(stdProvider.
      //                                 studentModelList[index]
      //                                     .name,style: TextStyle(
      //
      //                                     fontWeight: FontWeight.bold
      //                                 ),),
      //                               ],
      //                             ),
      //                           ),
      //                           Padding(
      //                             padding: const EdgeInsets.all(5.0),
      //                             child: Row(
      //                               mainAxisAlignment: MainAxisAlignment.center,
      //                               children: [
      //                                 Text("Id: ",
      //                                   style: TextStyle(
      //                                       color: Colors.teal,
      //                                       fontWeight: FontWeight.bold
      //                                   ),),
      //                                 Text(stdProvider.
      //                                 studentModelList[index].id),
      //                               ],
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   );
      //                 }
      //             ),
      //           ),
      //         ],
      //       );
      //     }
      // ),
    );
  }
}

