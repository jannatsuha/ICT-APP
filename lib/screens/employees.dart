import 'package:first_full_app/helper/custom_appbar.dart';
import 'package:first_full_app/model/employee_model.dart';
import 'package:flutter/material.dart';

EmployeeModel employeeModel1= EmployeeModel
  ("জনাব জুনাইদ আহ্‌মেদ পলক",
    "মাননীয় প্রতিমন্ত্রী ",
    "assets/image/p1.jpg",
    "+৮৮-০২-৪১০২৪০৩৮",
    "palak@ictd.gov.bd",
    "তথ্য ও যোগাযোগ প্রযুক্তি বিভাগ ");
EmployeeModel employeeModel2= EmployeeModel
  ("মোঃ সাইফুল ইসলাম",
    "মাননীয় প্রতিমন্ত্রীর একান্ত সচিব ",
    "assets/image/p2.jpg",
    "+৮৮-০২-৪১০২৪০৩৯",
    "saifkhokon@ictd.gov.bd",
    "তথ্য ও যোগাযোগ প্রযুক্তি বিভাগ ");
EmployeeModel employeeModel3= EmployeeModel
  ("শহিদুল আলম মজুমদার",
    "তথ্য ও জনসংযোগ কর্মকর্তা",
    "assets/image/p3.jpg",
    "+৮৮-০২-৫৫০০৬৯০৪",
    "sa.majumder65@gmail.com",
    "তথ্য ও যোগাযোগ প্রযুক্তি বিভাগ ");

List<EmployeeModel> allEmployeeList=[
  employeeModel1,
  employeeModel2,
  employeeModel3
];

class Employees extends StatefulWidget {
  const Employees({Key? key}) : super(key: key);

  @override
  _EmployeesState createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(titile:
          'All Employee List',)
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: allEmployeeList.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Center(
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.teal,
                                  width: 3
                                ),
                                color:Colors.teal,
                                borderRadius: BorderRadius.circular(180),
                                image: DecorationImage(
                                  image: AssetImage(
                                    allEmployeeList[index].image
                                  )
                                )
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("নাম: ",
                                style: TextStyle(
                                  fontSize: 20
                                ),),
                                Text(allEmployeeList[index].name,
                                  style: TextStyle(
                                      fontSize: 20
                                  ),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("পদবি: ",
                                  style: TextStyle(
                                      fontSize: 18
                                  ),),
                                Text(allEmployeeList[index].degi,
                                  style: TextStyle(
                                      fontSize: 18
                                  ),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("অফিস: ",
                                  style: TextStyle(
                                      fontSize: 18
                                  ),),
                                Text(allEmployeeList[index].office,
                                  style: TextStyle(
                                      fontSize: 18
                                  ),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ই-মেইল: ",
                                  style: TextStyle(
                                      fontSize: 18
                                  ),),
                                Text(allEmployeeList[index].email,
                                  style: TextStyle(
                                      fontSize: 18
                                  ),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ফোন : ",
                                  style: TextStyle(
                                      fontSize: 18
                                  ),),
                                Text(allEmployeeList[index].number,
                                  style: TextStyle(
                                      fontSize: 18
                                  ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
