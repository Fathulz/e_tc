import 'package:e_ticket/controller/adminController.dart';
import 'package:e_ticket/pages/adminBand_page.dart';
import 'package:e_ticket/pages/list_admin_page.dart';
import 'package:e_ticket/pages/list_pengguna_page.dart';
import 'package:e_ticket/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AdminPage extends StatelessWidget {
  AdminController ac = AdminController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Get.off(LoginPage());
            },
            child: Container(
              margin: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.logout_rounded,
                color: Colors.red,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.black,
        title: Text(
          "E-Ticket Consert",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(ListPenggunaPage());
                  },
                  child: TopCounter(
                      "Pengguna",
                      Icon(
                        Icons.person_rounded,
                        size: 50,
                      ),
                      "2"),
                ),
                GestureDetector(
                  onTap: () {
                    ac.adminCount();
                    Get.to(ListAdminPage());
                  },
                  child: TopCounter(
                      "Admin",
                      Icon(
                        Icons.co_present_rounded,
                        size: 50,
                      ),
                      "3"),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TopCounter(
                    "Band",
                    Icon(
                      Icons.groups_rounded,
                      size: 50,
                    ),
                    "4"),
                TopCounter(
                    "Pesanan",
                    Icon(
                      Icons.confirmation_num_rounded,
                      size: 50,
                    ),
                    "13"),
              ],
            ),
            Divider(
              height: 50,
              thickness: 2,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 5,
                  height: 30,
                  color: Colors.black,
                ),
                Text(
                  "LIST BAND",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(height: 10),
            SizedBox(height: 10),
            AdminBand("Dewa19", "Rock", "3", "dewaa19.png"),
            AdminBand("Guyon Waton", "Dangdut Akustik", "3", "gw.jpeg"),
            AdminBand("NOAH", "Pop Rock", "3", "noah.jpeg"),
            AdminBand("Fourtwnty", "Alternatif/Indie", "3", "frt.jpeg"),
          ],
        ),
      ),
    );
  }
}

class AdminBand extends StatelessWidget {
  String? amount, genre, band, img;

  AdminBand(this.band, this.genre, this.amount, this.img);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 0.1,
                    blurRadius: 1,
                  ),
                ],
                color: Colors.black,
                image: DecorationImage(
                    image: AssetImage("./assets/${this.img}"),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: 185,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(10),
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Text(
                  "${this.amount} tiket",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        ListTile(
          onTap: () {
            Get.to(AdminBandPage(this.band, this.img));
          },
          tileColor: Colors.black,
          contentPadding:
              EdgeInsets.only(bottom: 0, left: 20, right: 10, top: 10),
          leading: CircleAvatar(
            backgroundColor: Colors.red,
            child: FaIcon(
              FontAwesomeIcons.peopleGroup,
              size: 20,
              color: Colors.white,
            ),
          ),
          title: Text(
            "${this.band}",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FaIcon(
                FontAwesomeIcons.tag,
                size: 15,
                color: Colors.white,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "${this.genre}",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}

class TopCounter extends StatelessWidget {
  String? title, amount;
  Icon icon = Icon(Icons.person_rounded);
  TopCounter(this.title, this.icon, this.amount);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(5, 5),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          this.icon,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(this.title!),
              Text(
                "${this.amount}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
