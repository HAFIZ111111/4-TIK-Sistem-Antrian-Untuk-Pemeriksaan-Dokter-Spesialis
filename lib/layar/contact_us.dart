import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpl/admin/data_variable.dart';
import 'package:rpl/layar/booking.dart';
import 'package:rpl/layar/halaman_utama.dart';
import 'package:rpl/layar/pengaturan.dart';

class Contact_us extends StatefulWidget {
  const Contact_us({Key? key}) : super(key: key);

  @override
  State<Contact_us> createState() => _Contact_us();
}

class _Contact_us extends State<Contact_us> {
  @override
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (book == 0) {
        if (_selectedIndex == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pages1[3]),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pages1[_selectedIndex]),
          );
        }
      }
      if (book == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pages1[_selectedIndex]),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
            top: true,
            child: Scaffold(
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Color(0xff4EC72D),
                  selectedFontSize: 15,
                  selectedIconTheme:
                      IconThemeData(color: Colors.white, size: 30),
                  selectedItemColor: Colors.white,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profil',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Utama',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.list),
                      label: 'List',
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  onTap: _onItemTapped,
                ),
                body: 
                
                SingleChildScrollView( 
            child:
            Column(
                  children: <Widget>[
                    SizedBox(height: 10,),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding
                  (padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: 
                  Transform.scale(
                          scale: 1.4,
                          child: IconButton(
                            //iconSize: 50,
                            icon: Image.asset('assets/images/back.png'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Pengaturan()),
                              );
                            },
                          ),
                        ),),
                  Container(
                    width: 340,
                    child: 
                  Align(
                  alignment: Alignment.center,
                  child:    
                  Image.asset('assets/images/contactus.png'))) 
                ],
              ),
                    Padding(padding: EdgeInsets.all(16.0)),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 270, 5),
                        child: Text('Nama Lengkap',
                            style: TextStyle(fontSize: 15))),
                    Container(
                      height: 55,
                      width: 370,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Masukkan nama lengkap anda',
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.green),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15.0),
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.green, width: 2.0),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15.0),
                                )),
                            border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                              Radius.circular(15.0),
                            ))),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(2.0)),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 330, 5),
                        child: Text('Email', style: TextStyle(fontSize: 15))),
                    Container(
                      height: 55,
                      width: 370,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Masukkan email anda',
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.green),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15.0),
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.green, width: 2.0),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15.0),
                                )),
                            border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                              Radius.circular(15.0),
                            ))),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(2.0)),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 330, 5),
                        child: Text('Pesan', style: TextStyle(fontSize: 15))),
                    SizedBox(
                        height: 180,
                        width: 370,
                        child: TextField(
                          //controller: textarea,
                          keyboardType: TextInputType.multiline,
                          maxLines: 7,

                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.green, width: 2.0),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15.0),
                                )),
                            hintText: "isi pesan anda",
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.green),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15.0),
                                )),
                          ),
                        )),
                    Padding(padding: EdgeInsets.all(16.0)),
                    Container(
                        height: 36,
                        width: 310,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            alignment: Alignment.center,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Utama()),
                            );
                          },
                          child: Text(
                            "Kirim",
                            style: TextStyle(
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff4EC72D)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Color(0xff4EC72D),
                        )),
                  ],
                )))));
  }
}
