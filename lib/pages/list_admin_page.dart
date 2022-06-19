import 'package:e_ticket/controller/adminController.dart';
import 'package:e_ticket/controller/akunController.dart';
import 'package:e_ticket/controller/userController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListAdminPage extends StatelessWidget {
  AdminController ac = AdminController();
  UserController uc = UserController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Daftar Admin",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: ElevatedButton(
          onPressed: () {
            Get.defaultDialog(
              barrierDismissible: false,
              radius: 5,
              contentPadding: EdgeInsets.all(15),
              title: "Tambah Admin",
              content: Column(
                children: [
                  TextField(
                    controller: ac.fullName,
                    decoration: InputDecoration(
                        hintText: "Full Name",
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 15, left: 5)),
                  ),
                  TextField(
                    controller: ac.emailController,
                    decoration: InputDecoration(
                        hintText: "Email",
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 15, left: 5)),
                  ),
                  TextField(
                    controller: ac.passwordController,
                    decoration: InputDecoration(
                        hintText: "Password",
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 15, left: 5)),
                  )
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
                      uc.createAdmin(
                        ac.fullName,
                        ac.emailController,
                        ac.passwordController,
                      );
                    },
                    child: Text("TAMBAH", style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            );
          },
          child: Text(
            "+",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          style: ElevatedButton.styleFrom(
            fixedSize: Size(50, 63),
            primary: Colors.red,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ac.readAdminCard(),
          ],
        ),
      ),
    );
  }
}

class AdminCard extends StatelessWidget {
  const AdminCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding:
              EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
          tileColor: Colors.black,
          title: Text(
            "Nama",
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Row(
            children: [
              Icon(
                Icons.lock_rounded,
                color: Colors.red,
                size: 15,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "Email",
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
          trailing: ElevatedButton(
            onPressed: () {
              print("testing123");
            },
            child: CircleAvatar(
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
