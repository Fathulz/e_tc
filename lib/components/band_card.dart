import 'package:e_ticket/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BandCard extends StatelessWidget {
  final String band, genre, img, desc;

  BandCard(this.band, this.genre, this.img, this.desc);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 0.1,
              blurRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 400,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.asset(
                  "./assets/${img}",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  )),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: FaIcon(
                    FontAwesomeIcons.peopleGroup,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  "${this.band}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                subtitle: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.tags,
                      size: 15,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${this.genre}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                onTap: () {
                  Get.to(DetailPage(this.band, this.img, this.desc));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
