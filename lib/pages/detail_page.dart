import 'dart:ffi';

import 'package:e_ticket/components/ticket_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  String? band, img, desc;
  DetailPage(this.band, this.img, this.desc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Detail Band",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.amber,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("./assets/${this.img}"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Text(
              "${this.band}",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text("${this.desc}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              height: 5,
              thickness: 1.5,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "List Ticket",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TicketCard(
                    namaTicket: "Gelora Music 2022",
                    band: "Dewa19",
                    tanggal: "12 Nov 2022",
                    lokasi: "Samarinda, Gor Segiri",
                    harga: 35000),
                TicketCard(
                  namaTicket: "Music Word 2022",
                  band: "Dewa19",
                  tanggal: "12 Des 2022",
                  lokasi: "Samarinda, Gor Sempaja",
                  harga: 50000,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
