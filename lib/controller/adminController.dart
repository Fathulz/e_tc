import 'dart:convert';
import 'dart:math';

import 'package:e_ticket/pages/admin_page.dart';
import 'package:e_ticket/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import '../pages/list_pengguna_page.dart';

class AdminController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController fullName = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController namaEditingController = TextEditingController();
  TextEditingController tanggalEditingController = TextEditingController();
  TextEditingController lokasiEditingController = TextEditingController();
  TextEditingController hargaEditingController = TextEditingController();
  var event;

  void adminCount() {
    CollectionReference akun = firestore.collection("akun");
    var count = akun.where("role", isEqualTo: "admin").get();
    // List<LapanganModel> dataLapangan = hasil.docs.map((e) {
    //   return LapanganModel.fromJson(e.id, e.data() as Map<String, dynamic>);
    // }).toList();

    print("Outputnya = ${count.runtimeType}");
  }

  Future<void> getDataUser() async {
    CollectionReference tiket = firestore.collection('tiket');
    // final logged = FirebaseAuth.instance.currentUser!;
    // print(logged.email);
    tiket
        // .where('', isEqualTo: logged.email!)
        .snapshots()
        .listen((data) {
      print(data.docs[0]['fullName']);
      // userName = data.docs[0]['fullName'].obs;
      // print("testie" + userName.toString());
    });
  }

  StreamBuilder<QuerySnapshot> readUserCard() {
    CollectionReference akun = firestore.collection('akun');
    return StreamBuilder<QuerySnapshot>(
      stream: akun.where("role", isEqualTo: "user").snapshots(),
      builder: (_, snapshots) {
        return (snapshots.hasData)
            ? Column(
                children: snapshots.data!.docs
                    .map(
                      (e) => PenggunaCard(
                        e.get('nama'),
                        e.get('email'),
                        // e.get('pass'),
                      ),
                    )
                    .toList(),
              )
            : Text("Belum Ada Pengguna");
      },
    );
  }

  // Future getAdmin() async {
  //   CollectionReference akun = firestore.collection('akun');
  //   var dataAdmin =
  //       akun.where('role', isEqualTo: 'admin').snapshots().listen((event) {
  //     print(event.docs[0]['nama']);
  //     this.event = event.do;
  //   });
  // }
  StreamBuilder<QuerySnapshot> readAdminCard() {
    CollectionReference akun = firestore.collection('akun');
    return StreamBuilder<QuerySnapshot>(
      stream: akun.where("role", isEqualTo: "admin").snapshots(),
      builder: (_, snapshots) {
        // print(snapshots.data!.docs[0]['nama']);
        return (snapshots.hasData)
            ? Column(
                children: snapshots.data!.docs
                    .map(
                      (e) => PenggunaCard(
                        e.get('nama'), e.get('email'),
                        // e.get('pass'),
                      ),
                    )
                    .toList(),
              )
            : Text(
                "Belum Ada Data",
              );
      },
    );
  }
}
