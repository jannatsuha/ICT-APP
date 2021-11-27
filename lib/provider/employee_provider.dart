import 'package:first_full_app/model/employee_model.dart';
import 'package:first_full_app/repo/employee_repo.dart';
import 'package:flutter/foundation.dart';

class EmployeeProvider with ChangeNotifier{
  EmployeeRepo employeeRepo= EmployeeRepo();
  List<EmployeeModel> _employeeModelList=[];
  List<EmployeeModel> get employeeModelList => _employeeModelList;
  initializeAllEmployee(){
    if(_employeeModelList.length==0){
      _employeeModelList.clear();
      _employeeModelList= employeeRepo.getAllEmployeeList;
      notifyListeners();
    }
  }
}