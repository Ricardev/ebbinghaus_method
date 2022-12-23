import 'package:ebbinghaus_method/core/database/database.dart';
import 'package:ebbinghaus_method/core/dependency_injection.dart';
import 'package:ebbinghaus_method/core/permissions.dart';
import 'package:ebbinghaus_method/features/home/presentation/pages/folders_page.dart';
import 'package:flutter/material.dart';

void main() async {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  await CameraPermissions.askCameraPermission();
  await DatabaseApp.instance.dataBase;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FoldersPage(),
    );
  }
}
