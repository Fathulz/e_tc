import 'package:e_ticket/pages/admin_page.dart';
import 'package:e_ticket/pages/list_admin_page.dart';
import 'package:e_ticket/pages/login_page.dart';
import 'package:e_ticket/pages/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'dart:convert';

class UserController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void login() {
    CollectionReference akun = firestore.collection('akun');
    akun
        .where('email', isEqualTo: emailController.text)
        .where('pass', isEqualTo: passController.text)
        .snapshots()
        .listen((dataUser) {
      print("User :${dataUser.docs[0]['email']}");

      // if (dataUser.docs[0]['role'] == "user") {
      //   Get.offAll(
      //       MainPage(dataUser.docs[0]['email'], dataUser.docs[0]['nama']));
      // } else if (dataUser.docs[0]['role'] == "admin") {
      //   Get.offAll(AdminPage());
      // }
      ;
    });
  }

  // Future v

  Future create(TextEditingController nama, TextEditingController email,
      TextEditingController password) async {
    CollectionReference akun = firestore.collection('akun');
    try {
      var credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      akun.add({
        'idUser': credential.user!.uid,
        'nama': nama.text,
        'email': email.text,
        'role': 'user',
      });

      Get.off(LoginPage());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future createAdmin(TextEditingController nama, TextEditingController email,
      TextEditingController password) async {
    CollectionReference akun = firestore.collection('akun');
    try {
      var credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      akun.add({
        'idUser': credential.user!.uid,
        'nama': nama.text,
        'email': email.text,
        'role': 'admin',
      });

      Get.off(ListAdminPage());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  // Stream<List<String>>? read() {
  //   var data = firestore
  //       .collection("akun")
  //       .where("nama", isEqualTo: "Gary")
  //       .snapshots();
  //   // var dat = JsonDecoder(data));
  //   print('Outputnya : ${data}');
  // }
}
