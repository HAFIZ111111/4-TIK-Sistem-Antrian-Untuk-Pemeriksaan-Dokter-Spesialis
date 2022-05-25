import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpl/layar/bantuan.dart';
import 'package:rpl/layar/booking.dart';
import 'package:rpl/layar/contact_us.dart';
import 'package:rpl/layar/halaman_login.dart';
import 'package:rpl/layar/halaman_utama.dart';
import 'package:rpl/layar/pengaturan_notifikasi.dart';
import 'package:rpl/admin/data_variable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pengaturan extends StatefulWidget {
  const Pengaturan({Key? key}) : super(key: key);

  @override
  State<Pengaturan> createState() => _Pengaturan();
}

class _Pengaturan extends State<Pengaturan> {
  @override
  int _selectedIndex = 1;

  late SharedPreferences logindata;

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

  void _initial() async {
    logindata = await SharedPreferences.getInstance();

  }


  @override
  void initState() {
    super.initState();
    _initial();
    }
    





  konfirmasi_logout(BuildContext context) {


  // set up the buttons
  Widget cancelButton = Container(
                    height: 36,
                    width: 110,
                    child: TextButton(
                        style: TextButton.styleFrom( 
                        alignment: Alignment.center,
                        ),
                        onPressed: () {Navigator.pop(context); },
                        child: Text(
                          "Batal",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            
                          ),
                ),
                ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4EC72D)),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Color(0xff4EC72D),
                    )
                    );
  
  Widget continueButton = Container(
                    height: 36,
                    width: 110,
                    child: TextButton(
                        style: TextButton.styleFrom( 
                        alignment: Alignment.center,
                        ),
                        onPressed: () {
                        
 logindata.setBool('login', true);
                        Navigator.pop(context);
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (context) => Halaman_login()));
                        book = 0;
                        
                          },
                        child: Text(
                          "Konfirmasi",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            
                          ),
                ),
                ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4EC72D)),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Color(0xff4EC72D),
                    )
                    );

  // set up the AlertDialog
  AlertDialog alert2 = AlertDialog(
    title: Text("Konfirmasi"),
    content: Text("Logout dari aplikasi?"),
    actions: [
      Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      
      cancelButton,
      continueButton,])),
      SizedBox(height: 10,)
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert2;
    },
  );
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
                body: Column(
                  children: [
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
                                    builder: (context) => Utama()),
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
                  Image.asset('assets/images/penga.png'))) 
                ],
              ),
              SizedBox(height: 40,),
                    Container(
                        height: 60,
                        width: 370,
                        child: Row(
                          children: [
                            Container(
                                height: 60,
                                width: 60,
                                child: Icon(
                                  Icons.notifications,
                                  size: 30,
                                ),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xff4EC72D)),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        bottomLeft: Radius.circular(20.0)),
                                    color: Color(0xff4EC72D))),
                                    Container(
                                      width: 305,
                                      padding: EdgeInsets.fromLTRB(10,2,0,2),
                                      child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                            Text("Suara dan Getaran",
                            style: TextStyle(fontSize: 18
                        )),

                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Transform.scale(
                                scale: 1.4,
                                child: IconButton(
                                  //iconSize: 50,
                                  icon: Image.asset('assets/images/next.png'),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Pnotifikasi()),
                                    );
                                  },
                                ),
                              ),
                            ),]),)
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff4EC72D)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 13),
                    ),
                    Container(
                        height: 60,
                        width: 370,
                        child: Row(
                          children: [
                            Container(
                                height: 60,
                                width: 60,
                                child: Icon(
                                  Icons.help,
                                  size: 30,
                                ),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xff4EC72D)),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        bottomLeft: Radius.circular(20.0)),
                                    color: Color(0xff4EC72D))),
                           Container(
                                      width: 305,
                                      padding: EdgeInsets.fromLTRB(10,2,0,2),
                                      child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                            Text("Bantuan",
                            style: TextStyle(fontSize: 18
                        )),

                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Transform.scale(
                                scale: 1.4,
                                child: IconButton(
                                  //iconSize: 50,
                                  icon: Image.asset('assets/images/next.png'),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Bantuan()),
                                    );
                                  },
                                ),
                              ),
                            ),]),)
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff4EC72D)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 13),
                    ),
                    Container(
                        height: 60,
                        width: 370,
                        child: Row(
                          children: [
                            Container(
                                height: 60,
                                width: 60,
                                child: Icon(
                                  Icons.phone,
                                  size: 30,
                                ),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xff4EC72D)),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        bottomLeft: Radius.circular(20.0)),
                                    color: Color(0xff4EC72D))),
                            Container(
                                      width: 305,
                                      padding: EdgeInsets.fromLTRB(10,2,0,2),
                                      child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                            Text("Contact Us",
                            style: TextStyle(fontSize: 18
                        )),

                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Transform.scale(
                                scale: 1.4,
                                child: IconButton(
                                  //iconSize: 50,
                                  icon: Image.asset('assets/images/next.png'),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Contact_us()),
                                    );
                                  },
                                ),
                              ),
                            ),]),)
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff4EC72D)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 13),
                    ),
                    Container(
                        height: 60,
                        width: 370,
                        child: Row(
                          children: [
                            Container(
                                height: 60,
                                width: 60,
                                child: Icon(
                                  Icons.logout,
                                  size: 30,
                                ),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xffEC0404)),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        bottomLeft: Radius.circular(20.0)),
                                    color: Color(0xffEC0404))),
                            Container(
                                      width: 305,
                                      padding: EdgeInsets.fromLTRB(10,2,0,2),
                                      child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                            Text("Logout",
                            style: TextStyle(fontSize: 18
                        )),

                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Transform.scale(
                                scale: 1.4,
                                child: IconButton(
                                  //iconSize: 50,
                                  icon: Image.asset('assets/images/next.png'),
                                  onPressed: () {
                                    //konfirmasi_logout(context);
                                    konfirmasi_logout(context);
                                  },
                                ),
                              ),
                            ),]),)
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffEC0404)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                  ],
                ))));
  }
}
