import 'package:first_full_app/model/student_model.dart';
import 'package:first_full_app/repo/student_repo.dart';
import 'package:flutter/foundation.dart';

class StudentProvider with ChangeNotifier{
  StudentRepo studentRepo= StudentRepo();
  List<StudentModel> _studentModelList=[];
  List<StudentModel> get studentModelList => _studentModelList;

  initializeAllStudent(){
    if(_studentModelList.length==0){
      _studentModelList.clear();
      _studentModelList=studentRepo.getAllStdList;
      notifyListeners();
    }
  }

}