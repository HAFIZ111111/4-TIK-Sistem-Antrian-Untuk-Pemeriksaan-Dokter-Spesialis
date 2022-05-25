import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpl/admin/admin_utama.dart';
import 'package:rpl/layar/bantuan.dart';
import 'package:rpl/layar/bonus.dart';
import 'package:rpl/layar/booking.dart';
import 'package:rpl/layar/class_utama.dart';
import 'package:rpl/layar/halaman_daftar.dart';
import 'package:rpl/layar/halaman_profil.dart';
import 'package:rpl/layar/halaman_utama.dart';
import 'package:rpl/layar/infor.dart';
import 'package:rpl/layar/pengaturan.dart';
import 'package:rpl/layar/pengaturan_notifikasi.dart';
import 'package:rpl/layar/ubah_profil.dart';
import 'layar/contact_us.dart';
import 'layar/halaman_login.dart';
import 'layar/halaman_pembukaan.dart';
import 'layar/pilih_dokter.dart';
import 'layar/informasi.dart';
import 'package:rpl/layar/pilih_dokter.dart';


void main() {
  runApp(Apploen());
}

class Apploen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lope <3 :)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      home: Halaman_login(),
    );
  }
}




