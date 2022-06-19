import 'package:e_ticket/controller/tiketController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class AdminStock extends StatelessWidget {
  String? namaTicket, tanggal, lokasi, band;
  int harga;

  TiketController tc = TiketController();

  AdminStock(
      {required this.namaTicket,
      required this.tanggal,
      required this.lokasi,
      required this.harga});

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
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.grey.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                ),
                onPressed: () {
                  HapusTicket(context, "${this.namaTicket}", "${this.lokasi}");
                },
                child: Text(
                  "Hapus",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                ),
                onPressed: () {
                  EditTicket(context, "${this.namaTicket}", "${this.tanggal}",
                      "${this.lokasi}", this.harga);
                },
                child: Text(
                  "Edit",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}

Future<dynamic> HapusTicket(
    BuildContext context, String namaTiket, String lokasi) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        // backgroundColor: Colors.black,
        title: Text(
          "Hapus",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        content: Text("Yakin ingin menghapus  ${namaTiket} (${lokasi})?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Batal",
                style: TextStyle(color: Colors.black),
              )),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Yakin",
                style: TextStyle(color: Colors.red),
              ))
        ],
      );
    },
  );
}

Future<dynamic> EditTicket(BuildContext context, String namaTiket,
    String tanggal, String lokasi, int harga) {
  var total = harga.obs;
  TiketController tc = TiketController();
  tc.nTiketC.text = namaTiket;
  tc.tanggalC.text = tanggal;
  tc.lokasiC.text = lokasi;
  tc.hargaC.text = harga.toString();

  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        // backgroundColor: Colors.black,
        title: Text(
          "Ubah",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        content: Container(
          height: 200,
          child: ListView(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "${tc.nTiketC.text}",
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "${tc.tanggalC.text}",
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "${tc.lokasiC.text}",
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "${tc.hargaC.text}",
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Batal",
                style: TextStyle(color: Colors.black),
              )),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Simpan",
                style: TextStyle(color: Colors.red),
              ))
        ],
      );
    },
  );
}
