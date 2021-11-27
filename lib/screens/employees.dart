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

class _EmployeesState extends State<Employees> {
  @override
  Widget build(BuildContext context) {
    Provider.of<EmployeeProvider>(context,listen: false).initializeAllEmployee();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(titile:
          'All Employee List',)
      ),
      body:Consumer<EmployeeProvider>(
        builder: (context,employeeProvider,child){
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: employeeProvider.employeeModelList.length,
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
                                              employeeProvider.employeeModelList[index].image
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
                                    Text(employeeProvider.employeeModelList[index].name,
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
                                    Text(employeeProvider.employeeModelList[index].degi,
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
                                    Text(employeeProvider.employeeModelList[index].office,
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
                                    Text(employeeProvider.employeeModelList[index].email,
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
                                    Text(employeeProvider.employeeModelList[index].number,
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
