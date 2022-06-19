import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticket/controller/adminController.dart';
import 'package:e_ticket/controller/akunController.dart';
import 'package:e_ticket/pages/admin_page.dart';
import 'package:e_ticket/pages/daftar_page.dart';
import 'package:e_ticket/pages/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  AkunController akc = AkunController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none ||
                snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                return MainPage();
              } else {
                LoginPage();
              }
            }
            return ListView(
              children: [
                Center(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 140,
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
                                    controller: akc.emailController,
                                    style: TextStyle(color: Colors.red),
                                    decoration: InputDecoration(
                                      labelText: "Email",
                                      border: OutlineInputBorder(),
                                      hintText: "Masukkan Email",
                                      fillColor: Colors.white,
                                      filled: true,
                                      labelStyle: TextStyle(color: Colors.red),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.red, width: 2.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextField(
                                    controller: akc.passController,
                                    style: TextStyle(color: Colors.red),
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                      border: OutlineInputBorder(),
                                      hintText: "Masukkan Email",
                                      fillColor: Colors.white,
                                      filled: true,
                                      labelStyle: TextStyle(color: Colors.red),
                                      focusedBorder: OutlineInputBorder(
                                          // borderSide: const BorderSide(
                                          ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.to(DaftarPage());
                                        },
                                        child: Text(
                                          "Daftar",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.grey.shade500),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          // uc.login();
                                          akc.SignIn();
                                          // Get.to(AuthPage());
                                        },
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.only(
                                              left: 50, right: 50),
                                          primary: Colors.red,
                                        ),
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
                        top: 75,
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
                            Icons.person_rounded,
                            size: 100,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
