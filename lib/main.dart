import 'package:first_full_app/provider/employee_provider.dart';
import 'package:first_full_app/provider/quiz_provider.dart';
import 'package:first_full_app/screens/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers:[
          ChangeNotifierProvider<QuizProvider>(create: (_) => QuizProvider()),
          ChangeNotifierProvider<EmployeeProvider>(create: (_) => EmployeeProvider()),
        ],
      child: MyApp(),
    ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
