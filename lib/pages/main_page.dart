import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticket/components/band_card.dart';
import 'package:e_ticket/components/drawer_nav.dart';
import 'package:e_ticket/pages/admin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  String? email;
  var nama = "".obs;
  var akun;
  // var test = "irvan";
  MainPage() {
    final akunAuth = FirebaseAuth.instance.currentUser!;
    this.akun = akunAuth;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference akun = firestore.collection('akun');

    akun.where('idUser', isEqualTo: akunAuth.uid).snapshots().listen((event) {
      this.nama.value = event.docs[0]['nama'];
      if (event.docs[0]['role'] == "admin") {
        Get.off(AdminPage());
      }
      // print(nama.value);
    });

    // print(test);
  }

  // MainPage(this.email, this.nama);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Image.asset(
              "./assets/etc.png",
              width: 60,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "E-Ticket Consert",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: Obx(() => DrawerNav(akun.email, nama.value)),
      ),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          ListView(
            children: [
              SizedBox(
                height: 120,
              ),
              BandCard(
                "Dewa 19",
                "Rock",
                "dewaa19.png",
                "Dewa 19 adalah sebuah grup musik rock yang dibentuk pada tahun 26 Agustus 1986 di Surabaya, Indonesia. Grup ini telah beberapa kali mengalami pergantian personel dan formasi terakhirnya sebelum dibubarkan pada tahun 2011 adalah Ahmad Dhani, Andra Junaidi, Once Mekel, Yuke Sampurna dan Agung Yudha.",
              ),
              BandCard(
                "Guyon Waton",
                "Dangdut Akustik",
                "gw.jpeg",
                'Penggemar lagu-lagu musisi Indonesia dan daerah tentu sudah tak asing lagi dengan nama grup musik Guyon Waton. Band dangdut akustik yang personelnya sama-sama sekawan dari Kulon Progo, Daerah Istimewa Yogyakarta, ini dikenal dengan berbagai tembang hits, seperti "Korban Janji" dan "Perlahan".',
              ),
              BandCard(
                "NOAH",
                "Pop Rock",
                "noah.jpeg",
                "Noah adalah grup musik rok Indonesia yang dibentuk pada tahun 2000 di Bandung, Jawa Barat. Grup musik ini dibentuk dengan nama Peterpan oleh Ariel, Andika, Indra, Lukman, Reza dan Uki. Musik mereka secara umum bergenre pop rock alternatif dan pop rock, sebagian besar lagunya ditulis oleh sang vokalis, Ariel",
              ),
              BandCard("Fourtwnty", "Alternatif/Indie", "frt.jpeg",
                  "Fourtwnty adalah grup musik indie asal Indonesia. Grup ini beranggotakan Ari Lesmana, Nuwi dan Roots ini turut dibentuk oleh Roby Satria, yang juga merupakan personel Geisha. Asal Jakarta, Indonesia")
            ],
          ),
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 50,
                color: Colors.black,
              ),
              Positioned(
                top: 5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 0.1,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.receipt,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Belum Dibayar",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "5",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.date_range_rounded,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Konser",
                                    style: TextStyle(color: Colors.white)),
                                Text(
                                  "2",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
