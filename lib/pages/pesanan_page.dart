import 'package:e_ticket/components/drawer_nav.dart';
import 'package:e_ticket/components/riwayat_card.dart';
import 'package:e_ticket/components/pesanan_card.dart';
import 'package:e_ticket/components/ticket_card.dart';
import 'package:flutter/material.dart';

class PesananPage extends StatelessWidget {
  String? email, nama;

  PesananPage(this.email, this.nama);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: DrawerNav(this.email, this.nama),
      ),
      appBar: AppBar(
        title: Text("Halaman Pesanan"),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5),
                width: 5,
                height: 25,
                color: Colors.black,
              ),
              Text(
                "Belum Dibayar",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          Divider(),
          PesananCard(
              band: "Dewa 19",
              namaTicket: "Word Music 2022",
              tanggal: "18 Juni 2022",
              lokasi: "Samarinda",
              harga: 70000,
              j_tiket: 6),
          PesananCard(
              band: "Dewa 18",
              namaTicket: "Word Music 2022",
              tanggal: "18 Juni 2022",
              lokasi: "Samarinda",
              harga: 70000,
              j_tiket: 6),
          Divider(
            height: 30,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5),
                width: 5,
                height: 25,
                color: Colors.black,
              ),
              Text(
                "Riwayat",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          Divider(),
          RiwayatCard(
              band: "Dewa 20",
              namaTicket: "Music Award 2024",
              tanggal: "13 Juli 2024",
              lokasi: "Balikpapan",
              harga: 80000,
              j_tiket: 4,
              status: "sukses"),
          RiwayatCard(
              band: "Dewa 20",
              namaTicket: "Music Award 2024",
              tanggal: "13 Juli 2024",
              lokasi: "Balikpapan",
              harga: 80000,
              j_tiket: 4,
              status: "batal"),
          Divider(),
        ],
      ),
    );
  }
}
