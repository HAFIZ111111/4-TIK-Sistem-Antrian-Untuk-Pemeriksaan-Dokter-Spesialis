import 'package:flutter/material.dart';
import 'package:rpl/layar/class_pilih_dokter.dart';
import 'package:rpl/layar/halaman_utama.dart';
import 'package:rpl/layar/pilih_dokter.dart';

/// This is the main application widget.
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Dokter(),
    );
  }
}

