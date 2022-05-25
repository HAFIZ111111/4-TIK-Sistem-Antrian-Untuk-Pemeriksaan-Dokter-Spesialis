import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpl/admin/admin_class.dart';
import 'package:rpl/admin/data_variable.dart';
import 'package:rpl/database/data_fix.dart';
import 'package:rpl/layar/class_pilih_dokter.dart';
import 'package:rpl/layar/class_utama.dart';
import 'package:rpl/layar/halaman_daftar.dart';
import 'package:rpl/layar/halaman_login.dart';
import 'package:rpl/layar/halaman_utama.dart';
import 'package:shared_preferences/shared_preferences.dart';






List<Widget> halaman1 = <Widget>[
  Admin1(),
  Admin2(),
  Admin3()

];





class Admin_utama extends StatefulWidget {
  const Admin_utama({Key? key}) : super(key: key);

  @override
  State<Admin_utama> createState() => _Admin_utama();
}

class _Admin_utama extends State<Admin_utama> {
  int _count = 0;
  
  late SharedPreferences logindataadmin;
  late String username;
  int _selectedIndex1 = 0;

  
  void initial() async {
    logindataadmin = await SharedPreferences.getInstance();
  
    setState(() {
      //username = logindata.getString('username')!;
    });
  }

  

  @override
  void initState() {
    super.initState();
    print('$dokterZA manokkk');
    initial();
    print(pengguna);
    // Loading the diary when the app starts
  }
  
  
  void _onItemTapped1(int index1) {
    setState(() {
      _selectedIndex1 = index1;});
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
                        print("ini jalan keluarrrrrrr");
 logindataadmin.setBool('login1', true);
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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
            
        
            backgroundColor: Color(0xff4EC72D),

            selectedFontSize: 15,
            selectedIconTheme: IconThemeData(color: Colors.white, size: 30),
            selectedItemColor: Colors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Dokter',
                
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Antrean',
                
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.verified_user),
                label: 'User',
                
              ),

            ],
            currentIndex: _selectedIndex1,
            onTap: _onItemTapped1,
          ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: const Text('Halaman Admin'),
  actions: <Widget>[
    Center(child:
    Text("Keluar"),),
    Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: IconButton(
        padding: EdgeInsets.all(0),
            icon: Icon(
              Icons.exit_to_app,
            ),
            iconSize: 30,
            color: Colors.red,
            onPressed: () {
              konfirmasi_logout(context);
              },
          ),
    ),
  ],

      ),
      body: //HomePage1(),
      Center(child: halaman1.elementAt(_selectedIndex1)),
    );
  }
}