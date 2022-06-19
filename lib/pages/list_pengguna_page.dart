import 'package:e_ticket/controller/adminController.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ListPenggunaPage extends StatelessWidget {
  AdminController ac = AdminController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Daftar Pengguna",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ac.readUserCard(),
            // StreamBuilder<QuerySnapshot>(
            //   stream: akun.snapshots(),
            //   builder: (_, snapshots) {
            //     return (snapshots.hasData)
            //         ? Column(
            //             children: snapshots.data!.docs
            //                 .map(
            //                   (e) => PenggunaCard(
            //                     e.get('nama'),
            //                     e.get('email'),
            //                     e.get('pass'),
            //                   ),
            //                 )
            //                 .toList(),
            //           )
            //         : Text("Belum Ada Pengguna");
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

class PenggunaCard extends StatelessWidget {
  String? nama, email;
  PenggunaCard(this.nama, this.email);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding:
              EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 15),
          tileColor: Colors.black,
          title: Text(
            "${this.nama}",
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.red,
                    size: 15,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "${this.email}",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
          trailing: CircleAvatar(
            backgroundColor: Colors.red,
            child: TextButton(
              onPressed: () {},
              child: Icon(
                Icons.delete_forever,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}
