import 'package:deal_app/pages/katagori_bahan_bakar.dart';
import 'package:deal_app/pages/katagori_merk.dart';
import 'package:flutter/material.dart';

import '../katagori_plat.dart';

class Kategori extends StatelessWidget {
  const Kategori({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          KategoriItem(
            icon: 'assets/img/brand.png',
            title: 'Merk',
            route: KatagoriMerk(),
          ),
          KategoriItem(
              icon: 'assets/img/gas-pump.png',
              title: 'Bahan Bakar',
              route: KatagoriBahanBakar()),
          KategoriItem(
              icon: 'assets/img/license-plate.png',
              title: 'Plat',
              route: KatagoriPlat()),
        ],
      ),
    );
  }
}

class KategoriItem extends StatelessWidget {
  const KategoriItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.route});

  final String icon;
  final String title;
  final Widget route;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => route,
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 90,
            width: 90,
            child: Image.asset(icon),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
