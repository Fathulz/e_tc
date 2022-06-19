import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KonserCard extends StatelessWidget {
  String? img, band, namaTiket, tanggal, lokasi;

  KonserCard(this.img, this.band, this.namaTiket, this.tanggal, this.lokasi);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    image: AssetImage("./assets/${this.img}"),
                    fit: BoxFit.fill),
              ),
            ),
            Positioned(
              top: 135,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(10),
                width: 145,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Text(
                  "${tanggal}",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        ListTile(
          contentPadding:
              EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 30),
          tileColor: Colors.black,
          // leading: CircleAvatar(
          //   backgroundColor: Colors.red,
          //   child: FaIcon(
          //     FontAwesomeIcons.music,
          //     size: 20,
          //     color: Colors.white,
          //   ),
          // ),
          title: Text(
            "${this.namaTiket}",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${this.band}",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "${this.lokasi}",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
