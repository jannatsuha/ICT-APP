import 'package:first_full_app/helper/custom_appbar.dart';
import 'package:first_full_app/model/employee_model.dart';
import 'package:first_full_app/provider/employee_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Employees extends StatefulWidget {
  const Employees({Key? key}) : super(key: key);

  @override
  _EmployeesState createState() => _EmployeesState();
}
Widget appbarTitle= Text("Employee Details");
Icon actionIcon=Icon(Icons.search);
TextEditingController controller = new TextEditingController();
String filter="";
class _EmployeesState extends State<Employees> {
@override
  void initState() {
  controller.addListener(
          () {
        if(controller.text.isEmpty) {
          filter = "";
        } else {

          filter = controller.text;
        }
      }
  );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Provider.of<EmployeeProvider>(context,listen: false).initializeAllEmployee();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: appbarTitle,
        actions: [
                  IconButton(
                    onPressed:(){
                      setState(() {
                        if(actionIcon.icon==Icons.search){
                          appbarTitle=TextField(
                            onChanged: (val){
                              Provider.of<EmployeeProvider>
                                (context,listen: false).changeSearchString(val);
                            },
                            decoration: InputDecoration(
                              // prefixIcon: new Icon(Icons.search, color: Colors.white),
                              hintText: "Search...",
                              hintStyle: new TextStyle(color: Colors.white),
                            ),
                          );
                          actionIcon=Icon(Icons.clear);
                        }else{
                          appbarTitle=Text("Employee Details");
                          actionIcon=Icon(Icons.search);
                          controller.clear();
                        }
                        controller= controller;
                      });
                    },
                    icon: actionIcon)
        ],
      ),
      body:Consumer<EmployeeProvider>(
        builder: (context,employeeProvider,child){
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: employeeProvider.emps.length,
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
                                              employeeProvider.emps[index].image
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
                                    Text(employeeProvider.emps[index].name,
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
                                          fontSize: 15
                                      ),),
                                    Text(employeeProvider.emps[index].degi,
                                      style: TextStyle(
                                          fontSize: 15
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
                                    Text(employeeProvider.emps[index].office,
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
                                    Text(employeeProvider.emps[index].email,
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
                                    Text(employeeProvider.emps[index].number,
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
          );
        },
      )
    );
  }
}

