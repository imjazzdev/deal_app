import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deal_app/pages/detail.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'model/item_product.dart';

class Favorit extends StatelessWidget {
  var produk = FirebaseFirestore.instance
      .collection('product')
      .where('favorit', isEqualTo: true);

  @override
  Widget build(BuildContext context) {
    return Utils.IS_PENJUAL
        ? Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/img/404-error.png'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Halaman ini hanya tersedia bagi user',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('Favorit'),
            ),
            body: StreamBuilder<QuerySnapshot>(
                stream: produk.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 2 / 2.7,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      children: snapshot.data!.docs
                          .map((e) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Detail(
                                          img1: e['img1'],
                                          img2: e['img2'],
                                          img3: e['img3'],
                                          title: e['title'],
                                          harga: e['harga'],
                                          merk: e['merk'],
                                          lokasi: e['lokasi'],
                                          plat: e['plat'],
                                          bahan_bakar: e['bahan_bakar'],
                                          tangan_pertama_kedua:
                                              e['tangan_pertama_kedua'],
                                          pajak: e['pajak'],
                                          kondisi: e['kondisi'],
                                          kilometer: e['kilometer'],
                                          garasi: e['garasi'],
                                          kelengkapan_surat:
                                              e['kelengkapan_surat'],
                                          warna: e['warna'],
                                          tahun: e['tahun'],
                                          status: e['status'],
                                          kelengkapan_unit:
                                              e['kelengkapan_unit'],
                                          favorit: e['favorit'],
                                          kodeplat: e['kode_plat'],
                                        ),
                                      ));
                                },
                                child: ItemProduct(
                                    title: e['title'] ?? 'Example',
                                    harga: e['harga'] ?? 'Example',
                                    img: e['img1'] ??
                                        'https://firebasestorage.googleapis.com/v0/b/deal-app-c0f78.appspot.com/o/fortuner.jfif?alt=media&token=ccd93273-3713-4808-892f-4f68e0c72381',
                                    lokasi: e['lokasi'] ?? 'Example'),
                              ))
                          .toList(),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }));
  }
}
