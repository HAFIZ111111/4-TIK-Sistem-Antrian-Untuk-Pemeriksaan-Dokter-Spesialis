import 'package:flutter/material.dart';
import 'package:rpl/admin/admin_utama.dart';
import 'package:rpl/admin/data_variable.dart';
import 'package:rpl/database/data_fix.dart';
import 'package:rpl/layar/booking.dart';
import 'package:rpl/layar/class_utama.dart';
import 'package:rpl/layar/informasi.dart';

List<Map<String, dynamic>> dokterZA = [];
List<Map<String, dynamic>> jantung = [];
List<Map<String, dynamic>> gigi = [];
List<Map<String, dynamic>> mata = [];
List<Map<String, dynamic>> otak = [];
List<Map<String, dynamic>> kelamin = [];
List<Map<String, dynamic>> anak = [];
List<Map<String, dynamic>> saraf = [];
List<Map<String, dynamic>> mulut = [];
List<Map<String, dynamic>> adokterZA = [];
List<Map<String, dynamic>> ajantung = [];
List<Map<String, dynamic>> agigi = [];
List<Map<String, dynamic>> amata = [];
List<Map<String, dynamic>> aotak = [];
List<Map<String, dynamic>> akelamin = [];
List<Map<String, dynamic>> aanak = [];
List<Map<String, dynamic>> asaraf = [];
List<Map<String, dynamic>> amulut = [];
List<Map<String, dynamic>> dataUser1 = [];
List<Map<String, dynamic>> pasien = [];



//List dataUser1 = []; 

class Admin1 extends StatefulWidget {
  const Admin1({Key? key}) : super(key: key);
  @override
  _Admin1State createState() => _Admin1State();
}

class _Admin1State  extends State<Admin1> with SingleTickerProviderStateMixin {
  late TabController _tabController;
 //bool _isLoading = true;
 //List dataUser1 = []; 
void _refreshJournals2() async {
 //List dataUser1 = []; 
    final data = await DataAntrian.getItemNama("admin");
    setState(() {
      dataUser1= data;
    });
  }



void _runFilter(String enteredKeyword,  List<Map<String, dynamic>> dokter) {

    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      _refreshJournals1();
      // if the search field is empty or only contains white-space, we'll display all users
      results = dokter;
    } else {
      results = dokter
          .where((user) =>
              user["nama"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      jantung = results;
      dokterZA = results;
      gigi = results;
      mata = results;
      kelamin = results;
      anak = results;
      otak = results;
      saraf = results;
      mulut = results;
 

  });
}




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

 int noantrian1 = 0;
 int noantrian2 = 0;

 @override
  void initState() {
    super.initState();
    _refreshJournals1();
    _refreshJournals2();
    print('$dataUser1 manokkk');
    _tabController = new TabController(length: 9, vsync: this);
    if (dataUser1.length != 0){
      print("ini book 1");
      book = 1;
    }
    if (dataUser1.length == 0){
      print("ini book 0");
      book = 0;
    }
    
  }

final TextEditingController _nama = TextEditingController();
  //final TextEditingController _spesialis = TextEditingController();
  final TextEditingController _jw1 = TextEditingController();
   final TextEditingController _jw2 = TextEditingController();
  final TextEditingController _antrian1 = TextEditingController();
  final TextEditingController _antrian2 = TextEditingController();


String dropdownvalue = 'Jantung';   
  
  // List of items in our dropdown menu
  var items = [    
    'Jantung',
    'Gigi',
    'Mata',
    'Kejiwaan',
    'Kelamin',
    'Anak',
    'Saraf',
    'THT',
  ];

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
          dokterZA.firstWhere((element) => element['id'] == id);
      _nama.text = existingJournal['nama'];
      dropdownvalue = existingJournal['spesialis'];
      _jw1.text = existingJournal['jw1'];
      _jw2.text = existingJournal['jw2'];
      _antrian1.text = existingJournal['antrian1'].toString();
      _antrian2.text = existingJournal['antrian2'].toString();
    }

    showModalBottomSheet(
      
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => StatefulBuilder(
          
                        builder: (BuildContext context, StateSetter setState) {
                          return SafeArea(
          top: true,
          child: 

        Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 80,
              ),
              child: 
              SingleChildScrollView(
                child:
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text("ISI DATA DOKTER",
                  style: TextStyle(fontSize: 30, ),),
                  SizedBox(height: 10,),
                  TextField(
                    textInputAction: TextInputAction.next,
                    controller: _nama,
                    decoration: InputDecoration(
                    contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                //labelText: 'Enter something',
               // labelText: "Nama Dokter",
                hintText: "Nama Dokter",
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.green,
                ),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.green),
                  borderRadius: BorderRadius.circular(5),
                )),
                ),
                  SizedBox(height: 5,),
                 
                DropdownButton(
                
              // Initial Value
              value: dropdownvalue,
                
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),    
                
              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) { 
                setState(() {
            
  

                  dropdownvalue = newValue!;
                });
              },
             
            ),
      
                SizedBox(height: 5,),
                  TextField(
                    textInputAction: TextInputAction.next,
                    controller: _jw1,
                    decoration: InputDecoration(
                    contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                //labelText: 'Enter something',
                //labelText: "Jadwal 1",
                hintText: "Jadwal 1",
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.green,
                ),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.green),
                  borderRadius: BorderRadius.circular(5),
                )),
                ),
                SizedBox(height: 5,),
                  TextField(
                    textInputAction: TextInputAction.next,
                    controller: _jw2,
                    decoration: InputDecoration(
                    contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                //labelText: 'Enter something',
                //labelText: "Jadwal 2",
                hintText: "Jadwal 2",
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.green,
                ),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.green),
                  borderRadius: BorderRadius.circular(5),
                )),
                ),
                SizedBox(height: 5,),
                  TextField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    controller: _antrian1,
                    decoration: InputDecoration(
                    contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                //labelText: 'Enter something',
                //labelText: "Antrian",
                hintText: "Antrian jadwal 1",
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.green,
                ),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.green),
                  borderRadius: BorderRadius.circular(5),
                )),
                ),
                SizedBox(height: 5,),
                  TextField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    controller: _antrian2,
                    decoration: InputDecoration(
                    contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                //labelText: 'Enter something',
                //labelText: "Antrian",
                hintText: "Antrian jadwal 2",
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.green,
                ),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.green),
                  borderRadius: BorderRadius.circular(5),
                )),
                ),
                
                  ElevatedButton(
                    
                    onPressed: () async {

                      if (id == null) {
                        await _addItem();
                      }

                      if (id != null) {
                        await _updateItem(id);
                      }
                      
                      // Clear the text fields
                      _nama.text = '';
                      //_spesialis.text = '';
                      _jw1.text = '';
                      _jw2.text = '';
                      _antrian1.text = '1';
                      _antrian2.text = '1';

                      // Close the bottom sheet
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'Buat data baru' : 'Update data'),
                    style: ElevatedButton.styleFrom(
    primary: Colors.green, 
                  )
                  )
                ],
              ),
    )
    )
    );
  })
    );
  }

Future<void> _addItem() async {
    await DataDokter.createItem(
        _nama.text,
         dropdownvalue,
          _jw1.text, 
          _jw2.text,
          int.parse(_antrian1.text),
          int.parse(_antrian2.text),
          0,
          0);
    _refreshJournals1();
  }

  // Update an existing journal
  Future<void> _updateItem(int id) async {
    await DataDokter.updateItem(
        id, 
        _nama.text,
         dropdownvalue,
          _jw1.text, 
          _jw2.text,
          noantrian1 + int.parse(_antrian1.text),
          noantrian2 + int.parse(_antrian2.text),
          0,
          0);
    _refreshJournals1();
  }

 
  void _deleteItem(int id) async {
    await DataDokter.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a journal!'),
    ));
   _refreshJournals1();
  }

  dokterza(List dokter) {
    return ListView.builder(
              itemCount: dokter.length,
              itemBuilder: (context, index) => Center(
        child: 
Container(
  padding: EdgeInsets.all(5),
  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          width: 380,
        
          child:
          IntrinsicHeight(
            child:
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Container(
            width: 80,
              child: Icon(Icons.person,size: 80,),),
          Expanded(
            child:
          Container(
            //color: Colors.amber,
            padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          Text("Nama : " + dokter[index]['nama'],style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.green,),),
          SizedBox(height: 5,),
          Text("Spesialis : " + dokter[index]['spesialis'],style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.green,),),
          SizedBox(height: 5,),
          Text("Jadwal : " + dokter[index]['jw1'] 
          +", " + dokter[index]['jw2'],style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.green,),),
          SizedBox(height: 5,),
          Text("Banyak Antrian : " + "(" + dokter[index]['antrian1'].toString() +","+ dokter[index]['antrian2'].toString() + ")",style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.green,),),

          ]) )
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [IconButton(
                            icon: const Icon(Icons.edit,color: Colors.green,),
                            onPressed: () {

                              print(List<int>.generate(dokter[index]["antrian1"], (i) => i + 1));
                              _showForm(dokter[index]['id']);}
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete,color: Colors.green,),
                            onPressed: () =>
                                _deleteItem(dokter[index]['id']),
                          ),],

        )

    ])),decoration: BoxDecoration(
           border: Border.all(color: Color(0xff4EC72D)),
           borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Color.fromARGB(255, 255, 255, 255),
        
        
      ),
        
        ))
                    );
                    
                    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:
 Column(
        children: [

              SizedBox(height: 10,),
              SizedBox(
                width: 380,
                 height: 40,
                child: 
            TextField(
                 onChanged: (value){_runFilter(value,dokterZA);},
          
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
                SizedBox(height: 10,),
            
            PreferredSize(
            preferredSize: Size(200.0, 200.0),
            child:  Container(
              width: 380,
              height: 35,
              child:
            TabBar(
              isScrollable: true,
              indicator: BoxDecoration(
                //border: Border.all(color: Color(0xff4EC72D)),
                borderRadius: BorderRadius.circular(20), // Creates border
    color: Colors.green, 
),
              unselectedLabelColor: Colors.black,
              labelColor: Colors.white,
              tabs: [
                Tab(
                  text: 'Semua',
                ),
                Tab(
                  text: 'Jantung',
                ),
                Tab(
                  text: 'Gigi',
                ),
                Tab(
                  text: 'Mata',
                ),
                Tab(
                  text: 'Kejiwaan',
                ),
                Tab(
                  text: 'Kelamin',
                ),
                Tab(
                  text: 'Anak',
                ),
                Tab(
                  text: 'Saraf',
                ),
                Tab(
                  text: 'THT',
                ),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),)),
            SizedBox(height: 10,),
            
            Expanded(
              child: TabBarView(
                children: [
                  dokterza(dokterZA),
                  dokterza(jantung),
                  dokterza(gigi),
                  dokterza(mata),
                  dokterza(otak),
                  dokterza(kelamin),
                  dokterza(anak),
                  dokterza(saraf),
                  dokterza(mulut),
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text("Tambah"),
        backgroundColor: Colors.green,
        onPressed: () { _showForm(null);
        _refreshJournals1();
        }
      ),
      
     ) ;
          
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}



class Admin2 extends StatefulWidget {
  const Admin2({Key? key}) : super(key: key);
  @override
  _Admin2 createState() => _Admin2();
}

class _Admin2  extends State<Admin2> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Map<String, dynamic>> user = [];
  

  void _refreshJournals1() async {
 
    final data = await DataAntrian.getItems();
    final jantung1 = await DataAntrian.getItemSpesialis("Jantung");
    final gigi1 = await DataAntrian.getItemSpesialis("Gigi");
    final mata1 = await DataAntrian.getItemSpesialis("Mata");
    final otak1 = await DataAntrian.getItemSpesialis("Kejiwaan");
    final kelamin1 = await DataAntrian.getItemSpesialis("Kelamin");
    final anak1 = await DataAntrian.getItemSpesialis("Anak");
    final saraf1 = await DataAntrian.getItemSpesialis("Saraf");
    final mulut1 = await DataAntrian.getItemSpesialis("THT");

    setState(() {
      adokterZA = data;
      ajantung = jantung1;
      agigi = gigi1;
      amata = mata1;
      aotak = otak1;
      akelamin = kelamin1;
      aanak = anak1;
      asaraf = saraf1;
      amulut = mulut1;
 
    });
  }

 @override
  void initState() {
    super.initState();
    _refreshJournals1();
    print('$adokterZA manokkk9');
    _tabController = new TabController(length: 9, vsync: this);// Loading the diary when the app starts
  }

  void _deleteItem(int id) async {
    await DataAntrian.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Antrian Telah di panggil'),
    ));
   _refreshJournals1();
  }

  void _refreshJournals6(String data9) async {
 
    final data = await DataPasien.getItemNama("$data9");
      setState(() {
        user = data;
      });}

  Future<void> _updatebook(String nama) async {
    await DataPasien.updateBook(
        nama,
         user[0]['password'],
         user[0]['bpjs'],
        0,
        user[0]['email'], 
         user[0]['no_telepon']);
    _refreshJournals1();
  }

  Future<void> _addItem2(List dokter, int nilai) async {
    await DataNotif.createItem(
        dokter[nilai]['namap'],
        dokter[nilai]['no_antrian'],
         dokter[nilai]['jw'],
         dokter[nilai]['namad'],
        );
    _refreshJournals1();
  }



  void _runFilter(String enteredKeyword,  List<Map<String, dynamic>> dokter) {

    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      _refreshJournals1();
      // if the search field is empty or only contains white-space, we'll display all users
      results = dokter;
    } else {
      results = dokter
          .where((user) =>
              user["namad"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      ajantung = results;
      adokterZA = results;
      agigi = results;
      amata = results;
      akelamin = results;
      aanak = results;
      aotak = results;
      asaraf = results;
      amulut = results;
 

  });
}

 

antrianza(List dokter) {
    return ListView.builder(
              itemCount: dokter.length,
              itemBuilder: (context, index) => Center(
        child: 
Container(
  padding: EdgeInsets.all(5),
  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          width: 370,
        
          child:
          IntrinsicHeight(
            child:
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Container(
            alignment: Alignment.center,        
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
          
           border: Border.all(color: Color(0xff4EC72D),width: 2),
           borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
              child: Text(dokter[index]['no_antrian'].toString(),style: TextStyle(
                fontSize: 50,
              ),)),
          Expanded(
            child:
          Container(
            //color: Colors.amber,
            padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          Text("Nama : " + dokter[index]['namap'],style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.green,),),
          SizedBox(height: 5,),
          Text("Dokter : " + dokter[index]['namad'],style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.green,),),
          SizedBox(height: 5,),
          Text("Spesialis : " + dokter[index]['spesialis'],style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.green,),),
          SizedBox(height: 5,),
          Text("Jadwal : " + dokter[index]['jw'],style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.green,),),
          SizedBox(height: 5,),
          Text("Pembayaran : " + dokter[index]['pb'],style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.green,),),
          SizedBox(height: 5,),
          Text("Keluhan : " + dokter[index]['keluhan'],style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.green,),),

          ]) )
        ),
        
                          IconButton(
                            icon: const Icon(Icons.check_circle,color: Colors.red,size: 40,),
                            onPressed: () {

                              _refreshJournals6(dokter[index]['namap']);
                                Future.delayed(const Duration(milliseconds: 1000), () {


   print(user);
   _updatebook(user[0]['username']);
                                _deleteItem(dokter[index]['id']);
                                _addItem2(dokter,index);


   });
                           
                                }

                          ),

        

    ])),decoration: BoxDecoration(
           border: Border.all(color: Color(0xff4EC72D)),
           borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Color.fromARGB(255, 255, 255, 255),
        
        
      ),
        
        ))
                    );
                    
                    }

  @override
  Widget build(BuildContext context) {
    return  
 Column(
        children: [
              SizedBox(height: 10,),
              SizedBox(
                width: 380,
                height: 40,
                child: 
            TextField(
                 onChanged: (value){_runFilter(value,adokterZA);},
          
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
                SizedBox(height: 10,),
              
            PreferredSize(
            preferredSize: Size(200.0, 200.0),
            child:  Container(
              width: 380,
              height: 35,
              child:
            TabBar(
              isScrollable: true,
              indicator: BoxDecoration(
                //border: Border.all(color: Color(0xff4EC72D)),
                borderRadius: BorderRadius.circular(20), // Creates border
    color: Colors.green, 
),
              unselectedLabelColor: Colors.black,
              labelColor: Colors.white,
              tabs: [
                Tab(
                  text: 'Semua',
                ),
                Tab(
                  text: 'Jantung',
                ),
                Tab(
                  text: 'Gigi',
                ),
                Tab(
                  text: 'Mata',
                ),
                Tab(
                  text: 'Kejiwaan',
                ),
                Tab(
                  text: 'Kelamin',
                ),
                Tab(
                  text: 'Anak',
                ),
                Tab(
                  text: 'Saraf',
                ),
                Tab(
                  text: 'THT',
                ),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),)),
            SizedBox(height: 10,),
            Expanded(
              child: TabBarView(
                children: [
                  antrianza(adokterZA),
                  antrianza(ajantung),
                  antrianza(agigi),
                  antrianza(amata),
                  antrianza(aotak),
                  antrianza(akelamin),
                  antrianza(aanak),
                  antrianza(asaraf),
                  antrianza(amulut),
                ],
                controller: _tabController,
              ),
            ),
          ],
        )
      
          ;
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}




class Admin3 extends StatefulWidget {
  const Admin3({Key? key}) : super(key: key);
  @override
  _Admin3 createState() => _Admin3();
}

class _Admin3  extends State<Admin3> with SingleTickerProviderStateMixin {


  void _refreshJournals1() async {
 
    final data = await DataPasien.getItems();


    setState(() {
      pasien = data;

    });
  }

  

 @override
  void initState() {
    super.initState();
    _refreshJournals1();
    print('$adokterZA manokkk9');
   // Loading the diary when the app starts
  }

  void _deleteItem(int id) async {
    await DataPasien.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('User Telah di Hapus'),
    ));
   _refreshJournals1();
  }

  void _runFilter(String enteredKeyword,  List<Map<String, dynamic>> dokter) {

    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      _refreshJournals1();
      // if the search field is empty or only contains white-space, we'll display all users
      results = dokter;
    } else {
      results = dokter
          .where((user) =>
              user["username"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      pasien = results;
  });
}


  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child:
    Center(
      child:
    Column(
      children: [
        SizedBox(height: 10,),
        SizedBox(
                width: 380,
                height: 40,
                child: 
            TextField(
                 onChanged: (value){_runFilter(value,pasien);
                 },
          
                    decoration: InputDecoration(
                       suffixIcon: Icon(Icons.search,color: Colors.green,),
                    contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                //labelText: 'Enter something',
               // labelText: "Nama Dokter",
                hintText: "Cari User",
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
                SizedBox(height: 10,),
        Container(
          width: 380,
          height: 470,

          child:
 ListView.builder(
              itemCount: pasien.length,
              itemBuilder: (context, index) => Center(
        child: 
Container(
  padding: EdgeInsets.all(5),
  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          width: 380,
        
          child:
          IntrinsicHeight(
            child:
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Expanded(
            child:
          Container(
            //color: Colors.amber,
            padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          Text("Nama : " + pasien[index]['username'],style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.green,),),
          SizedBox(height: 5,),
          Text("Password : " + pasien[index]['password'],style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.green,),),
          SizedBox(height: 5,),
          Text("Email : " + pasien[index]['email'],style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.green,),),
          SizedBox(height: 5,),
          Text("No Telepon : " + pasien[index]['no_telepon'],style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.green,),),
  
          ]) )
        ),
        
                          IconButton(
                            icon: const Icon(Icons.delete,color: Colors.red,size: 40,),
                            onPressed: () {
     
                                
   _deleteItem(pasien[index]['id']);


 

                               
                          })

        

    ])),decoration: BoxDecoration(
           border: Border.all(color: Color(0xff4EC72D)),
           borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Color.fromARGB(255, 255, 255, 255),
        
        
      ),
        
        ))
                    ))])));
      
          
  }
  
  @override
  void dispose() {
    super.dispose();
  }
}


