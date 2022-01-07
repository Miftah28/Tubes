// ignore_for_file: prefer_const_constructors

import 'package:button_navigation_bar/button_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tubes_fixs/model/user_model.dart';
import 'package:tubes_fixs/screens/AddNote_screen.dart';
import 'package:tubes_fixs/screens/login_screen.dart';
import 'package:tubes_fixs/screens/notes_screen.dart';
import 'package:tubes_fixs/screens/user_screen.dart';
import 'package:tubes_fixs/screens/detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beranda"),
        centerTitle: true,
      ),
      body: _PageList(),
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonNavigationBar(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        children: [
          ButtonNavigationItem(
              icon: Icon(
                Icons.home_outlined,
                size: 30,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreen()));
              }),
          ButtonNavigationItem(
              icon: Icon(
                Icons.book,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => noteScreen()));
              }),
          ButtonNavigationItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => userScreen()));
              }),
        ],
      ),
    );
  }
}

class _PageList extends StatefulWidget {
  _PageStateListState createState() => _PageStateListState();
}

class _PageStateListState extends State<_PageList> {
  List<String> judul = [
    "Bubur Ayam",
    "Mie Goreng",
    "Mie Rebus",
    "Nasi Goreng",
    "Nugget",
    "Sosis Bakar",
    "Telor Ceplok",
    "Kue Dorayaki"
  ];

  List<String> gambar = [
    "images/buryam.jpg",
    "images/mie goreng.jpg",
    "images/mie rebus.jpg",
    "images/nasgor.jpg",
    "images/nugget.jpg",
    "images/sosis.jpg",
    "images/telor ceplok.jpg",
    "images/kue-dorayaki.jpg"
  ];

  List<String> resep = [
    "Belilah SuperBubur di warung terdekat, sajikan di mangkok kesayangann anda tuang air panas secukupnya, tunggu beberapa menit, siap dihidangkan",
    "Pisahkan bumbu dengan mie dari kemasan, masukkan mie dalam rebusan, tunggu beberapa menit, tiriskan mie dari air rebusan, campurkan bumbu yang tadi dipisahkan lalu aduk, mie goreng siap disajikan",
    "Masukkan mie dan bumbu dalam rebusan, tunggu beberapa menit, tuang mie dengan air rebusan, mie rebus siap disajikan",
    "Masukkan nasi dalam wajan, masukkan juga beberapa bumbu, aduk terus hingga nasi rata akan bumbu, angkat nasi lalu hidangkan, dan jangan lupa tambahkan beberapa topping seperti kerupuk",
    "Ambillah beberapa nugget dari kemasan, siapkan wajan beserta minyak nya, gorenglah nugget di wajan yg telah disediakan, tunggu beberapa menit, tiriskan, lalu hidangkan lah nugget dengan sesuka hati",
    "Ambil sosis dari kemasan, siapkan alat panggangan, biarkan panggangan panas terlebih dahulu, buatlah pola pada sosis untuk kematangan yang sempurna, letakkan sosis pada pangganngan, tungggu beberapa menit, sosis siap dihidangkan",
    "Siapkan wajan dan juga minyak, panaskan minyak terlebih dahulu, setelah minyak panas ceplokkan telor pada wajan, tunggu hinga tekstur telor berubah, angkat dan telur siap dihidangkan",
    "Siapkan wadah. Masukkan Kobe Tepung Pisang Goreng Crispy, susu bubuk, dan fermipan. Aduk hingga rata,Masukkan air, telur, dan mentega cair ke dalam campuran tepung. Aduk hingga rata. Diamkan selama 30 menit – 1 jam (sampai adonan ada seperti gelembung-gelembung),Panaskan cetakan kue dorayaki dengan api kecil dan olesi margarin. Tuang adonan ke dalam cetakan, kemudian tutup. Masak hingga bagian bawah matang,Bila sudah matang balik dorayaki dan tunggu hingga matang sempurna"
  ];

  List<String> sampel = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: judul.length,
        itemBuilder: (BuildContext contex, int index) {
          final title = judul[index].toString();
          final img = gambar[index].toString();
          final sample = sampel[index].toString();
          final resepmakanan = resep[index].toString();
          return Container(
            height: 200,
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  backgroundImage(img),
                  Container(
                    child: topContent(title, sample),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                              itemJudul: title,
                              itemImage: img,
                              qty: resepmakanan,
                            )));
              },
            ),
          );
        },
      ),
    );
  }
}

backgroundImage(String gambar) {
  // ignore: unnecessary_new
  return new Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.luminosity),
            image: AssetImage(gambar))),
  );
}

topContent(String nama, String sample) {
  // ignore: unnecessary_new
  return new Container(
    height: 150,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            nama,
            style: bigHeaderText,
          ),
          Container(
            height: 1,
            width: 100,
            color: Colors.redAccent,
          ),
          Text(
            sample,
            style: footerHeaderText,
          )
        ],
      ),
    ),
  );
}

final baseTextStyle = const TextStyle(fontFamily: 'arial');

final bigHeaderText = baseTextStyle.copyWith(
    fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white);

final descHeaderText = baseTextStyle.copyWith(
    fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white);

final footerHeaderText = baseTextStyle.copyWith(
    fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white);

final detailstyle = baseTextStyle.copyWith(
    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);
