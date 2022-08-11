import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treeclass/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tree ClassFrase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: Routes.pageList,
      initialRoute: Routes.home,
    );
  }
}
