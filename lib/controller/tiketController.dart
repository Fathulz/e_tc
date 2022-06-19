import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticket/pages/admin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TiketController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController bandC = TextEditingController();
  TextEditingController hargaC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController tanggalC = TextEditingController();
  TextEditingController nTiketC = TextEditingController();

  Future pushDataTicket(
      namaband,
      TextEditingController namaEditingController,
      TextEditingController tanggalEditingController,
      TextEditingController lokasiEditingController,
      TextEditingController hargaEditingController) async {
    CollectionReference tiket = firestore.collection('tiket');
    tiket.add({
      'namaBand': namaband,
      'namaEvent': namaEditingController.text,
      'tanggalEvent': tanggalEditingController.text,
      'lokasi': lokasiEditingController.text,
      'harga': hargaEditingController.text,
    });

    Get.off(AdminPage());
  }

  Future<String?> getDataTiket(String band) async {
    CollectionReference tiket = firestore.collection('tiket');
    tiket.where('namaBand', isEqualTo: band).snapshots().listen((data) {
      // print(data.docs[0]['lokasi']);
      // return data.docs[0]['lokasi'].toString();
      // userName = data.docs[0]['fullName'].obs;
      // print("testie" + userName.toString());
    });
  }
}
