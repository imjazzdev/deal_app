import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deal_app/pages/detail.dart';
import 'package:deal_app/pages/model/carousel_banner.dart';
import 'package:deal_app/pages/model/kategori.dart';
import 'package:deal_app/pages/search.dart';
import 'package:flutter/material.dart';

import 'model/item_product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final produk = FirebaseFirestore.instance.collection('product').limit(4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: Icon(Icons.person),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Search(),
                    ));
              },
              icon: Icon(
                Icons.search_rounded,
                size: 30,
              ))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
        children: [
          CarouselBanner(),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Katagori',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Kategori(),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Untuk Anda',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
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
          // GridView(
          //       padding: const EdgeInsets.all(15),
          //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //           maxCrossAxisExtent: 200,
          //           childAspectRatio: 2 / 2.8,
          //           crossAxisSpacing: 20,
          //           mainAxisSpacing: 20),
          //       children: snapshot.data!.docs
          //           .map((e) => InkWell(
          //                 onTap: () {
          //                   Navigator.push(
          //                       context,
          //                       MaterialPageRoute(
          //                         builder: (context) => Detail() ));
          //                 },
          //                 child: ItemProduct(
          //                   img: e['imgURL1'],
          //                   title: e['nama_kost'],
          //                   kecamatan: e['lokasi_kecamatan'],
          //                   harga: e['harga_kost'],
          //                 ),
          //               ))
          //           .toList(),
          //     );
        ],
      ),
    );
  }
}
