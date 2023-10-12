import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deal_app/pages/edit_detail.dart';
import 'package:deal_app/pages/model/item_keterangan.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/utils.dart';

class Detail extends StatefulWidget {
  final String img1;
  final String img2;
  final String img3;
  final String title;
  final String merk;
  final String harga;
  final String lokasi;
  final String plat;
  final String kodeplat;
  final String bahan_bakar;
  final String tangan_pertama_kedua;
  final String pajak;
  final String kondisi;
  final String kilometer;
  final String garasi;
  final String kelengkapan_surat;
  final String warna;
  final String tahun;
  final String status;
  final String kelengkapan_unit;
  final bool favorit;
  const Detail({
    super.key,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.title,
    required this.harga,
    required this.merk,
    required this.lokasi,
    required this.plat,
    required this.kodeplat,
    required this.bahan_bakar,
    required this.tangan_pertama_kedua,
    required this.pajak,
    required this.kondisi,
    required this.kilometer,
    required this.garasi,
    required this.kelengkapan_surat,
    required this.warna,
    required this.tahun,
    required this.status,
    required this.kelengkapan_unit,
    required this.favorit,
  });

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Future addFavorit(bool val) async {
    final doc =
        FirebaseFirestore.instance.collection('product').doc(widget.title);
    doc.update(
      {
        'favorit': !val,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              CarouselSlider(
                options: CarouselOptions(
                    aspectRatio: 1 / 1,
                    height: MediaQuery.of(context).size.height * 0.3,
                    autoPlay: false,
                    autoPlayInterval: const Duration(seconds: 10),
                    autoPlayAnimationDuration: const Duration(seconds: 5),
                    disableCenter: false,
                    pauseAutoPlayInFiniteScroll: true,
                    viewportFraction: 0.83,
                    enlargeCenterPage: true),
                items: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 3,
                            offset: const Offset(2, 2),
                            color: Colors.blue.shade400)
                      ]),
                      child: CachedNetworkImage(
                        imageUrl: widget.img1,
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                        errorWidget: (context, url, error) => Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.wifi,
                              size: 60,
                              color: Colors.red,
                            ),
                            Text(
                              error.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ],
                        )),
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                      // child: Image.asset(
                      //   'assets/img/carousel.jpg',
                      //   fit: BoxFit.cover,
                      //   width: double.maxFinite,
                      // ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: widget.img2,
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                      errorWidget: (context, url, error) => Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.wifi,
                            size: 60,
                            color: Colors.red,
                          ),
                          Text(
                            error.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ],
                      )),
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                    // child: Image.asset(
                    //   'assets/img/carousel.jpg',
                    //   fit: BoxFit.cover,
                    //   width: double.maxFinite,
                    // ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: widget.img3,
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                      errorWidget: (context, url, error) => Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.wifi,
                            size: 60,
                            color: Colors.red,
                          ),
                          Text(
                            error.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ],
                      )),
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                    // child: Image.asset(
                    //   'assets/img/carousel.jpg',
                    //   fit: BoxFit.cover,
                    //   width: double.maxFinite,
                    // ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.title,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.lokasi,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.blue),
                            ),
                            Text(
                              widget.merk,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                        Utils.IS_PENJUAL
                            ? InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditDetailProduk(
                                                  img1: widget.img1,
                                                  img2: widget.img2,
                                                  img3: widget.img3,
                                                  title: widget.title,
                                                  merk: widget.merk,
                                                  harga: widget.harga,
                                                  lokasi: widget.lokasi,
                                                  plat: widget.plat,
                                                  kodeplat: widget.kodeplat,
                                                  bahan_bakar:
                                                      widget.bahan_bakar,
                                                  tangan_pertama_kedua: widget
                                                      .tangan_pertama_kedua,
                                                  pajak: widget.pajak,
                                                  kondisi: widget.kondisi,
                                                  kilometer: widget.kilometer,
                                                  garasi: widget.garasi,
                                                  kelengkapan_surat:
                                                      widget.kelengkapan_surat,
                                                  warna: widget.warna,
                                                  tahun: widget.tahun,
                                                  status: widget.status,
                                                  kelengkapan_unit:
                                                      widget.kelengkapan_unit,
                                                  favorit: widget.favorit)));
                                },
                                child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.grey,
                                        size: 30,
                                      ),
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey.shade200),
                                    )),
                              )
                            : SizedBox(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Keterangan',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.grey.shade700),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ItemKeterangan(
                            icon: 'assets/img/license-plate.png',
                            title: widget.plat,
                            color: Colors.purple.shade100),
                        ItemKeterangan(
                            icon: 'assets/img/gas-pump.png',
                            title: widget.bahan_bakar,
                            color: Colors.purple.shade100),
                        ItemKeterangan(
                            icon: 'assets/img/handshake.png',
                            title: widget.tangan_pertama_kedua,
                            color: Colors.purple.shade100),
                        ItemKeterangan(
                            icon: 'assets/img/taxes.png',
                            title: widget.pajak,
                            color: Colors.purple.shade100),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: Text(
                        'Informasi detail',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.grey.shade700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Table(
                        columnWidths: {
                          0: const FlexColumnWidth(1),
                          1: const FlexColumnWidth(1)
                        },
                        children: [
                          TableRow(children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                "Kondisi",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                widget.kondisi,
                                style: const TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                "Pajak",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                widget.pajak,
                                style: const TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                "Kilometer",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                '${widget.kilometer} /km',
                                style: const TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                "Garasi",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                widget.garasi,
                                style: const TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                "Kelengkapan surat",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                widget.kelengkapan_surat,
                                style: const TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                "Warna",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                widget.warna,
                                style: const TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                "Tahun",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                widget.tahun,
                                style: const TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                "Status",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                widget.status,
                                style: const TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                "Kode plat",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                widget.kodeplat,
                                style: const TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                "Kelengkapan unit",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                widget.kelengkapan_unit,
                                style: const TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 250,
                        child: Divider(
                          thickness: 1.5,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Text(
                        'Pilihan credit',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.grey.shade700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset('assets/img/hsbc.png'),
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset('assets/img/bca.png')),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset('assets/img/mega.png')),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset('assets/img/bri.png')),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Text(
                        'Pembayaran',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.grey.shade700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset('assets/img/leasing.png')),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset('assets/img/cash.png')),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset('assets/img/credit.png')),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 20,
            top: 8,
            child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey.withOpacity(0.4),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ))),
          ),
        ],
      )),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 2),
        padding:
            const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.purple.shade50,
            border: Border.all(color: Colors.purple.shade200),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(1, 1),
                  blurRadius: 10,
                  color: Colors.purple.withOpacity(0.2))
            ]
            // gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: [Colors.purple.shade200, Colors.pink.shade100]),
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.harga,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                try {
                  launchUrl(Uri.parse('https://wa.me/+6287869003437'));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(e.toString()),
                    backgroundColor: Colors.orange.shade400,
                  ));
                }
              },
              child: Image.asset(
                'assets/img/whatsapp.png',
                height: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                AwesomeDialog(
                  context: context,
                  animType: AnimType.scale,
                  dialogType: DialogType.warning,
                  title: 'Tambahkan ke favorit?',
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {
                    setState(() {
                      addFavorit(widget.favorit);
                    });
                  },
                ).show();
              },
              icon: Icon(
                widget.favorit ? Icons.bookmark : LineIcons.bookmark,
                size: 30,
                color: Colors.purple,
              ),
            )
          ],
        ),
      ),
    );
  }
}
