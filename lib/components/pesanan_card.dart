import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class PesananCard extends StatelessWidget {
  String? namaTicket, tanggal, lokasi, band;
  int harga;
  int j_tiket;

  PesananCard(
      {required this.band,
      required this.namaTicket,
      required this.tanggal,
      required this.lokasi,
      required this.harga,
      required this.j_tiket});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.black),
          child: ListTile(
            contentPadding:
                EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 20),
            // tileColor: Colors.black,
            isThreeLine: true,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "${this.namaTicket}",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.groups_rounded,
                      color: Colors.white,
                      size: 15,
                    ),
                    Text(
                      "  ${this.band}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.date_range_rounded,
                      color: Colors.white,
                      size: 15,
                    ),
                    Text(
                      " ${this.tanggal}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: Colors.white,
                      size: 15,
                    ),
                    Text(
                      "  ${this.lokasi}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Text(
                        "Rp. ",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        "${this.harga}",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                )
              ],
            ),
            trailing: Container(
              padding: EdgeInsets.all(10),
              color: Colors.red,
              child: Text(
                "${this.j_tiket}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
          ),
          onPressed: () {
            HapusTicket(context, "${this.namaTicket}", this.harga, this.j_tiket,
                "${this.band}");
          },
          child: Text(
            "Batalkan Pesanan",
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}

Future<dynamic> HapusTicket(BuildContext context, String namaTiket, int harga,
    int j_tiket, String band) {
  var count = 1.obs;
  var total = harga.obs;

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        // backgroundColor: Colors.black,
        title: Text(
          "Hapus",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        content: Text("Yakin ingin menghapus  ${namaTiket} (${band})?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  Text(
                    "Batal",
                    style: TextStyle(),
                  ),
                  Text(
                    "Yakin",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ))
        ],
      );
    },
  );
}
