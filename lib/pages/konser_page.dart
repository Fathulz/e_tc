import 'package:e_ticket/components/drawer_nav.dart';
import 'package:e_ticket/components/konser_card.dart';
import 'package:flutter/material.dart';

class KonserPage extends StatelessWidget {
  String? email, nama;

  KonserPage(this.email, this.nama);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: DrawerNav(this.email, this.nama),
      ),
      appBar: AppBar(
        title: Text("Halaman Konser"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 5,
                  height: 25,
                  color: Colors.black,
                  margin: EdgeInsets.only(right: 10),
                ),
                Text(
                  "Konser Yang Anda Ikuti",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Divider(),
            KonserCard("dewaa19.png", "Dewa19", "Music Award 2022",
                "18 Agustus 2022", "Samarida, Balaikota"),
            KonserCard("dewaa19.png", "Dewa19", "Music Award 2022",
                "18 Agustus 2022", "Samarida, Balaikota"),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 5,
                  height: 25,
                  color: Colors.black,
                  margin: EdgeInsets.only(right: 10),
                ),
                Text(
                  "Riwayat",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Divider(),
            KonserCard("dewaa19.png", "Dewa19", "Music Award 2022",
                "18 Agustus 2022", "Samarida, Balaikota"),
            KonserCard("dewaa19.png", "Dewa19", "Music Award 2022",
                "18 Agustus 2022", "Samarida, Balaikota"),
          ],
        ),
      ),
    );
  }
}
