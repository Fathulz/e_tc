import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketCard extends StatelessWidget {
  String? namaTicket, tanggal, lokasi, band;
  int harga;

  TicketCard(
      {required this.namaTicket,
      required this.band,
      required this.tanggal,
      required this.lokasi,
      required this.harga});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black),
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
            onTap: () {
              BeliTicket(
                  context, "${this.namaTicket}", "${this.band}", this.harga);
            },
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}

Future<dynamic> BeliTicket(
    BuildContext context, String namaTiket, String band, int harga) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        // backgroundColor: Colors.black,
        title: Text(
          namaTiket,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        content: Text("Pesan ticket ${namaTiket} (${band}) seharga ${harga} ?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Tidak",
                style: TextStyle(color: Colors.black),
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                "Ya",
                style: TextStyle(color: Colors.red),
              ))
        ],
      );
    },
  );
}
