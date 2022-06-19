import 'package:flutter/material.dart';

class RiwayatCard extends StatelessWidget {
  String? namaTicket, tanggal, lokasi, band, status;
  int harga;
  int j_tiket;

  RiwayatCard(
      {required this.band,
      required this.namaTicket,
      required this.tanggal,
      required this.lokasi,
      required this.harga,
      required this.j_tiket,
      required this.status});

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                    Row(
                      children: [
                        Icon(
                          Icons.confirmation_num_rounded,
                          color: Colors.white,
                          size: 15,
                        ),
                        Text(
                          " ${this.j_tiket} Tiket",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                      if (status == "sukses") ...[
                        Container(
                          alignment: Alignment.center,
                          height: 25,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          // width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.green.shade400,
                          ),
                          child: Text(
                            "Terbayar",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ] else ...[
                        Container(
                          alignment: Alignment.center,
                          height: 25,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          // width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.shade500,
                          ),
                          child: Text(
                            "Dibatalkan",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ]
                    ],
                  ),
                )
              ],
            ),
            // trailing: Container(
            //   padding: EdgeInsets.all(10),
            //   color: Colors.white,
            //   child: Text(
            //     "${this.j_tiket}",
            //     style: TextStyle(
            //         color: Colors.grey.shade700,
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
          ),
        ),
        // if (status == "sukses") ...[
        //   Container(
        //     alignment: Alignment.center,
        //     height: 50,
        //     width: double.infinity,
        //     color: Colors.green.shade400,
        //     child: Text(
        //       "Terbayar",
        //       style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        // ] else ...[
        //   Container(
        //     alignment: Alignment.center,
        //     height: 50,
        //     width: double.infinity,
        //     color: Colors.grey.shade400,
        //     child: Text(
        //       "Dibatalkan",
        //       style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        // ],
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
