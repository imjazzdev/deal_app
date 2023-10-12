import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deal_app/pages/detail.dart';
import 'package:deal_app/utils/utils.dart';
import 'package:flutter/material.dart';

import 'model/item_product.dart';

class SearchDetail extends StatelessWidget {
  const SearchDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final produk = FirebaseFirestore.instance
        .collection('product')
        .where('merk', isEqualTo: Utils.VAL_SEARCH_NOW);
    return Scaffold(
      appBar: AppBar(
        title: Text(Utils.VAL_SEARCH_NOW),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: produk.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView(
                padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
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
                                    kelengkapan_surat: e['kelengkapan_surat'],
                                    warna: e['warna'],
                                    tahun: e['tahun'],
                                    status: e['status'],
                                    kelengkapan_unit: e['kelengkapan_unit'],
                                    favorit: e['favorit'],
                                    kodeplat: e['kode_plat'],
                                  ),
                                ));
                          },
                          child: ItemProduct(
                            title: e['title'] ?? 'Example',
                            harga: e['harga'] ?? 'Example',
                            img: e['img1'],
                            lokasi: e['lokasi'] ?? 'Example',
                          ),
                        ))
                    .toList(),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
