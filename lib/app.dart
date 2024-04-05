import 'package:firebase_storage_assignment/photo_grid_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Grid',
      home: const PhotoGridScreen(),
      builder: EasyLoading.init(),
    );
  }
}
