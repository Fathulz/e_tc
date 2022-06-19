import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticket/controller/userController.dart';
import 'package:e_ticket/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaftarPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final UserController uc = UserController();
  var checked = false.obs;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference akun = firestore.collection('akun');

    return Scaffold(
      appBar: AppBar(
        title: Text("Bergabung Bersama Kami"),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 90,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 0.1,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        padding: EdgeInsets.only(
                            top: 90, left: 15, right: 15, bottom: 35),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: uc.namaController,
                              decoration: InputDecoration(
                                labelText: "Nama Anda",
                                border: OutlineInputBorder(),
                                hintText: "Masukkan Nama",
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextField(
                              controller: uc.emailController,
                              decoration: InputDecoration(
                                labelText: "Email Anda",
                                border: OutlineInputBorder(),
                                hintText: "Masukkan Email",
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextField(
                              obscureText: true,
                              controller: uc.passController,
                              decoration: InputDecoration(
                                labelText: "Password Anda",
                                border: OutlineInputBorder(),
                                hintText: "Masukkan Password",
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Obx(
                                  () => ListTile(
                                    leading: Checkbox(
                                        value: checked.value,
                                        onChanged: (value) {
                                          checked.value = value!;
                                        }),
                                    title: Text(
                                      "Saya setuju dengan syarat dan ketentuan penggunaan aplikasi.",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  child: Text(
                                    "Daftar",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    padding:
                                        EdgeInsets.only(left: 100, right: 100),
                                    primary: Colors.red,
                                  ),
                                  onPressed: () {
                                    if (checked == true) {
                                      uc.create(
                                        uc.namaController,
                                        uc.emailController,
                                        uc.passController,
                                      );
                                      Get.back();
                                    }
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 25,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(75.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 0.1,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.groups_rounded,
                      size: 100,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
