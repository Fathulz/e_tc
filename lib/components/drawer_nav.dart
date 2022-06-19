import 'package:e_ticket/pages/admin_page.dart';
import 'package:e_ticket/pages/konser_page.dart';
import 'package:e_ticket/pages/login_page.dart';
import 'package:e_ticket/pages/main_page.dart';
import 'package:e_ticket/pages/pesanan_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DrawerNav extends StatelessWidget {
  String? nama, email;
  DrawerNav(this.email, this.nama);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView(
        children: [
          SizedBox(
            height: 200,
            child: DrawerHeader(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person_rounded,
                        size: 60,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${this.nama}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("${this.email}")
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 0.5, color: Colors.grey.shade500),
                  ),
                ),
                child: ListTile(
                  // selectedTileColor: Color.fromRGBO(227, 252, 191, 1),
                  style: ListTileStyle.list,
                  leading: Icon(
                    Icons.list_alt_rounded,
                    color: Colors.red,
                  ),
                  title: Text(
                    "List Band",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  trailing: Container(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    width: 40,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Text(
                      "12",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: () {
                    // Get.off(MainPage(this.email, this.nama));
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 0.5, color: Colors.grey.shade500),
                  ),
                ),
                child: ListTile(
                  style: ListTileStyle.list,
                  onTap: () {
                    Get.off(PesananPage(this.email, this.nama));
                  },
                  leading: Icon(
                    Icons.bookmark_added_rounded,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Ticket Dipesan",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  trailing: Container(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    width: 40,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Text(
                      "2",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 0.5, color: Colors.grey.shade500),
                  ),
                ),
                child: ListTile(
                  style: ListTileStyle.list,
                  leading: Icon(
                    Icons.date_range_rounded,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Jadwal Konser",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  trailing: Container(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    width: 40,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Text(
                      "5",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.off(KonserPage(this.email, this.nama));
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 0.5, color: Colors.grey.shade500),
                    bottom: BorderSide(width: 0.5, color: Colors.grey.shade500),
                  ),
                ),
                child: ListTile(
                  style: ListTileStyle.list,
                  leading: Icon(
                    Icons.exit_to_app_rounded,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Keluar",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  onTap: () {
                    // SystemNavigator.pop();
                    FirebaseAuth.instance.signOut();
                    // Get.offAll(AdminPage());
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
