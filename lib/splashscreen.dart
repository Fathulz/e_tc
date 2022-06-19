import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticket/pages/admin_page.dart';
import 'package:e_ticket/pages/login_page.dart';
import 'package:e_ticket/pages/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/splash.jpg'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                margin: EdgeInsets.only(bottom: 100, top: 100),
                child: Text(
                  "Pesan ticket konser dengan mudah  secara online dengan aplikasi kami. Kami menyediakan beberapa ticket konser yang bisa langsung anda pesan.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.off(LoginPage());
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromWidth(250),
                    primary: Colors.red,
                    padding: EdgeInsets.only(top: 15, bottom: 15)),
                child: Text(
                  "Mulai Sekarang",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
