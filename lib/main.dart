import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_meeting_prompta/controllers/data_controller.dart';
import 'package:personal_meeting_prompta/views/Home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<DataController>(DataController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
