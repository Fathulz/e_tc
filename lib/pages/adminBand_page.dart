import 'package:e_ticket/components/admin_stock.dart';
import 'package:e_ticket/controller/adminController.dart';
import 'package:e_ticket/controller/tiketController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminBandPage extends StatelessWidget {
  String? band, img;
  AdminBandPage(band, img) {
    tc.getDataTiket(band.toString());
    this.band = band;
    this.img = img;
  }

  // AdminController ac = AdminController();
  TiketController tc = TiketController();

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
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              height: 5,
              thickness: 1.5,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "List Ticket",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton.icon(
                  onPressed: () {
                    AddPopup(this.band);
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.red,
                  ),
                  label: Text(
                    "Tambah",
                    style: TextStyle(color: Colors.red),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AdminStock(
                    namaTicket: "Music Festival",
                    tanggal: "19-03-2022",
                    lokasi: "Samarinda, Balaikota",
                    harga: 75000),
                AdminStock(
                    namaTicket: "Music Festival",
                    tanggal: "19-03-2022",
                    lokasi: "Samarinda, Balaikota",
                    harga: 75000),
                AdminStock(
                    namaTicket: "Music Festival",
                    tanggal: "19-03-2022",
                    lokasi: "Samarinda, Balaikota",
                    harga: 75000)
              ],
            ),
          )
        ],
      ),
    );
  }
}

Future AddPopup(band) {
  TiketController tc = TiketController();
  AdminController ac = AdminController();
  return Get.defaultDialog(
    barrierDismissible: false,
    radius: 5,
    contentPadding: EdgeInsets.all(15),
    title: "Tambah Tiket",
    content: Column(
      children: [
        TextField(
          controller: ac.namaEditingController,
          decoration: InputDecoration(
              hintText: "Nama Event",
              isDense: true,
              contentPadding: EdgeInsets.only(top: 15, left: 5)),
        ),
        TextField(
          controller: ac.tanggalEditingController,
          decoration: InputDecoration(
              hintText: "Tanggal",
              isDense: true,
              contentPadding: EdgeInsets.only(top: 15, left: 5)),
        ),
        TextField(
          controller: ac.lokasiEditingController,
          decoration: InputDecoration(
              hintText: "Lokasi",
              isDense: true,
              contentPadding: EdgeInsets.only(top: 15, left: 5)),
        ),
        TextField(
          controller: ac.hargaEditingController,
          decoration: InputDecoration(
              hintText: "Harga",
              isDense: true,
              contentPadding: EdgeInsets.only(top: 15, left: 5)),
        ),
      ],
    ),
    confirm: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            "BATAL",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        TextButton(
          onPressed: () {
            tc.pushDataTicket(
              band,
              ac.namaEditingController,
              ac.tanggalEditingController,
              ac.lokasiEditingController,
              ac.hargaEditingController,
            );
          },
          child: Text("TAMBAH", style: TextStyle(color: Colors.red)),
        ),
      ],
    ),
  );
}
