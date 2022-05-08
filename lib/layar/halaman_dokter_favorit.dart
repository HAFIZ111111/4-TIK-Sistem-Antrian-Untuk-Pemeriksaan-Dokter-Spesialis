import 'package:flutter/material.dart';
import 'package:rpl/layar/booking.dart';
import 'package:rpl/layar/halaman_utama.dart';
import 'package:rpl/layar/informasi.dart';
import 'package:rpl/layar/pilih_rs.dart';

class Foto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Container(
          height: 100,
          width: 370,
          child: TextButton(
            style: TextButton.styleFrom(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Booking()),
              );
            },
            child: Row(
              children: [
                Image.asset('assets/images/foto.png'),
                Padding(padding: EdgeInsets.all(5.0)),
                Text('''dr. ihsan

Spesialis Jantung

Tersedia''',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    )),
                Padding(padding: EdgeInsets.all(40.0)),
                Image.asset('assets/images/uselove.png'),
              ],
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff4EC72D), width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ));
  }
}

class Semua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        child: Container(
          height: 31,
          width: 75,
          child: Center(
            child: Text("Jantung"),
          ),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ));
  }
}

final List<Widget> semua = [
  Semua(),
  Semua(),
  Semua(),
  Semua(),
  Semua(),
  Semua(),
  Semua(),
  Semua(),
];

final List<Widget> foto = [
  Foto(),
  Foto(),
];

class Dokter_favorit extends StatefulWidget {
  const Dokter_favorit({Key? key}) : super(key: key);

  @override
  State<Dokter_favorit> createState() => _Dokter_favorit();
}

class _Dokter_favorit extends State<Dokter_favorit> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
            top: true,
            child: Scaffold(
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                body: SingleChildScrollView(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 8, 70, 20),
                          child: Transform.scale(
                            scale: 1.4,
                            child: IconButton(
                              //iconSize: 50,
                              icon: Image.asset('assets/images/back.png'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Utama()),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                          child: Image.asset('assets/images/dokterfavorit.png'),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: 41,
                        width: 380,
                        child: TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffEBF1FA),
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50.0),
                                ),
                              ),
                              hintText: 'Pencarian',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 20),
                              prefixIcon: Icon(Icons.search)),
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: SizedBox(
                        height: 31,
                        width: 370,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: semua,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: SizedBox(
                        height: 470,
                        width: 370,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: foto,
                        ),
                      ),
                    ),
                  ],
                )))));
  }
}
