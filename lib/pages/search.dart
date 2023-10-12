import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deal_app/pages/search_detail.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'detail.dart';
import 'model/item_product.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final produk = FirebaseFirestore.instance.collection('product');
    TextEditingController searchC = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.only(left: 15, right: 15),
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 60,
            child: TextField(
              onSubmitted: (val) {
                Utils.VAL_SEARCH_NOW = val;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchDetail(),
                    ));
              },
              controller: searchC,
              decoration: InputDecoration(
                  fillColor: Colors.purple,
                  hoverColor: Colors.purple,
                  focusColor: Colors.purple,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        Utils.VAL_SEARCH_NOW = searchC.text;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchDetail(),
                            ));
                      },
                      icon: Icon(
                        Icons.search_rounded,
                        size: 30,
                      )),
                  labelText: 'Search',
                  hintText: 'Cari berdasarkan merk'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          StreamBuilder<QuerySnapshot>(
              stream: produk.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
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
                                        kelengkapan_unit: e['kelengkapan_unit'],
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
              })
        ],
      )),
    );
  }
}
