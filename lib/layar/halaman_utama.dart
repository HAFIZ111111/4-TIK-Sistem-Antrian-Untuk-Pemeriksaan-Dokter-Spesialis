
import 'package:flutter/material.dart';
import 'package:rpl/admin/admin_class.dart';
import 'package:rpl/admin/admin_utama.dart';
import 'package:rpl/database/data_fix.dart';
import 'package:rpl/layar/booking.dart';
import 'package:rpl/layar/halaman_login.dart';
import 'package:rpl/layar/halaman_notifikasi.dart';
import 'package:rpl/layar/halaman_profil.dart';
import 'package:rpl/layar/infor.dart';
import 'package:rpl/layar/informasi.dart';
import 'package:rpl/layar/pengaturan.dart';
import 'package:rpl/layar/pilih_dokter.dart';
import 'package:rpl/admin/data_variable.dart';
import 'package:rpl/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bonus.dart';
import 'class_utama.dart';

//Padding(
                   // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  // child: Image.asset('assets/images/jantung2.png'),
                  //);
List pages1 = [
  Profil(),
  Utama(),
  Info(),
  Infor()
];





class Utama extends StatefulWidget {
  const Utama({Key? key}) : super(key: key);
 
  @override
  State<Utama> createState() => _Utama();
}
 
class _Utama extends State<Utama> {
  late SharedPreferences logindata;
  late String username;
  int _selectedIndex = 1;
  bool _loading = false;
  bool _cari = false;
  bool _tutup = false;
  
 void _refreshJournals1() async {
    final jantung1 = await DataDokter.getItemSpesialis("Jantung");
    final gigi1 = await DataDokter.getItemSpesialis("Gigi");
    final mata1 = await DataDokter.getItemSpesialis("Mata");
    final otak1 = await DataDokter.getItemSpesialis("Kejiwaan");
    final kelamin1 = await DataDokter.getItemSpesialis("Kelamin");
    final anak1 = await DataDokter.getItemSpesialis("Anak");
    final saraf1 = await DataDokter.getItemSpesialis("Saraf");
    final mulut1 = await DataDokter.getItemSpesialis("THT");
    final data = await DataDokter.getItems();
    setState(() {
      dokterZA = data;
      jantung = jantung1;
      gigi = gigi1;
      mata = mata1;
      otak = otak1;
      kelamin = kelamin1;
      anak = anak1;
      saraf = saraf1;
      mulut = mulut1;
    });
  }

  void _refreshJournals2(String pengguna) async {
 
    final data = await DataPasien.getItemNama(pengguna);
      setState(() {
        users = data;
      });
     
   
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
  
    setState(() {
      username = logindata.getString('username')!;
      pengguna = username;
      _refreshJournals2(pengguna);
      Future.delayed(const Duration(milliseconds: 1000), () {
      print(pengguna + "iniiiiiiakuuuu");
      print("$users" + "iniiiiiiuserrr");
      print(book);
      book = users[0]['book'];

                          });
    });
  }

  

  @override
  void initState() {
    //book = users[0]['book'];
    super.initState();
    print(pengguna);
    _refreshJournals1();
    _refreshJournals2(pengguna);
    initial();

   // _refreshJournals2(pengguna);
    // Loading the diary when the app starts
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(book);
      if(book == 0){
        if ( _selectedIndex == 2 ){
          print('halaman book 0');
        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => pages1[3]),);
          
  
} else {
    Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => pages1[_selectedIndex]),

                        );
}}
if (book == 1){
Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => pages1[_selectedIndex]),);
}
      

    });
  }
  

void _runFilter(String enteredKeyword,  List<Map<String, dynamic>> dokter) {

    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      setState(() {
        _cari = true;
      });
      _refreshJournals1();
      // if the search field is empty or only contains white-space, we'll display all users
      results = dokter;
       setState(() {
        _tutup = true;
      });

    } else {
      results = dokter
          .where((user) =>
              user["nama"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      dokterZA = results;
 
 

  });
}



dokterZa(List dokter) {
   return
    ListView.builder(
      scrollDirection: Axis.horizontal,
              itemCount: dokter.length,
              itemBuilder: (context, index) => Center(
        child:
  Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                child:  
                                Material(
  //elevation: 10,
  borderRadius: BorderRadius.all(Radius.circular(10)),
  child: 
                Container(
                    height: 150,
                    width: 133,
                    child: TextButton(
                        style: TextButton.styleFrom( 
                        alignment: Alignment.center,
                        ),
                        onPressed: () {
                          index2 = index;
                        print(index);
                        print(pengguna);
                        print(users);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Booking()),
                        );
                        database1 = dokter;
                        print('ini + $users ini');
                        
                        },
                        child: Column(
                          children: [
                            Expanded(child:
          Container(
            width: 120,
            decoration: BoxDecoration(
           border: Border.all(color: Colors.green,width: 2),
           borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Color(0xffEBF1FA),),
              child: 
              FittedBox(
    child:
  Icon(Icons.person,size: 80,color: Colors.green,),)),),
                            
                            
                        Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),),  
                        
                        Text(dokter[index]['nama'],
                        textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            
                         ),),
                         Text(
                          "Spesialis " + dokter[index]['spesialis'],
                          style: TextStyle(
                            color: Colors.green,fontWeight: FontWeight.bold
                        
 
                          ),
                ),
                         ])
                ),
                    decoration: BoxDecoration(
                      
                      //border: Border.all(color: Color(0xff4EC72D)),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Color(0xffEBF1FA),
                    boxShadow: [
      BoxShadow(
        color: Colors.grey,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(4, 4)
        ),],)
                    ),
                    ))));}

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: 
     SafeArea(

          top: true,
          child: 
          Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      
          bottomNavigationBar: BottomNavigationBar(
            
        
            backgroundColor: Color(0xff4EC72D),


            selectedFontSize: 15,
            selectedIconTheme: IconThemeData(color: Colors.white, size: 30),
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


      
          _loading
      ? 
      Center(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Text("Selamat datang $pengguna",style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green),),
                        SizedBox(height: 30,),
      SizedBox(
        height: 70,
        width: 70,
        child:
      CircularProgressIndicator(
            backgroundColor: Colors.grey,
            color: Colors.green,
         
          strokeWidth: 10,
          
          ))])): 

          
          SingleChildScrollView( 
            child:
            

            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                   child: Image.asset('assets/images/logoutama.png'),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child:
                    Row(
                      children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 8, 0),
                   child: Container(
                                height: 41,
                                width: 41,
                                child: IconButton(
                                  padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.notifications,
                    ),
                    color: Colors.white,
                    iconSize: 30,
                    onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dokter_favorit()),
                        );},
                  ),
                                decoration: BoxDecoration(
                                  boxShadow: [
      BoxShadow(
        color: Colors.grey,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(4, 4)
        ),],
                                    border:
                                        Border.all(color: Color(0xff4EC72D)),
                                    borderRadius: BorderRadius.all( Radius.circular(5.0)),
                                 
                                    color: Color(0xff4EC72D))),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 8, 0),
                   child: Container(
                                height: 41,
                                width: 41,
                                child: 
                                IconButton(
                                  padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.settings,
                    ),
                    color: Colors.white,
                    iconSize: 30,
                    onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Pengaturan()),
                        );},
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
      BoxShadow(
        color: Colors.grey,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(4, 4)
        ),],
                                    border:
                                        Border.all(color: Color(0xff4EC72D)),
                                    borderRadius: BorderRadius.all( Radius.circular(5.0)),
                                 
                                    color: Color(0xff4EC72D)))),
                  ]))]),
               Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),),
                    SizedBox(
                width: 380,
                 height: 40,
                child: 
            TextField(
                 onChanged: (value){_runFilter(value,dokterZA);
                 },
          
                    decoration: InputDecoration(
                       suffixIcon: Icon(Icons.search,color: Colors.green,),
                    contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                //labelText: 'Enter something',
               // labelText: "Nama Dokter",
                hintText: "Cari Dokter",
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.green,
                ),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.amber),
                  borderRadius: BorderRadius.circular(20),
                ))
                
                ),),


      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child:
                      Row( 
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/images/dokter.png'),
                  
                  TextButton(onPressed: (){
                    
                    b = 0;

                    Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dokter()),
                        );
                      
                    
                  }, child: Text('Lihat semua',style: TextStyle(color: Colors.black),))
                   ],
                      ),),
                  Spesialis1(),
                 Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child:
                      Row( 
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/images/dokter2.png'),
                  
                  TextButton(onPressed: (){
                    b = 0;

                    Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dokter()),
                        );
                  }, child: Text('Lihat semua',style: TextStyle(color: Colors.black),))
                   ],
                      ),),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child:
                  Container(
                      height: 160,
                      width: 370,
                        child:
                      dokterZa(dokterZA)
                    ),),
                    
                    ],
                  )
            ]
          )
      ),
    )
    ));
  }
}



















