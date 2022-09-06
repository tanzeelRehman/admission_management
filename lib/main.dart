import 'package:admission_management/constants/colors.dart';
import 'package:admission_management/controllers/StudentController.dart';
import 'package:admission_management/view/add_record.dart';
import 'package:admission_management/view/homepage.dart';
import 'package:admission_management/view/record_details.dart';
import 'package:admission_management/view/search_record.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  StudentController controller = Get.put(StudentController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //flutter devices
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application

          // is not restarted.
          ),
      home: HomePage(),
    );
  }
}
