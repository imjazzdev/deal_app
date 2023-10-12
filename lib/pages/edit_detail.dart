// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:shimmer/shimmer.dart';

class EditDetailProduk extends StatefulWidget {
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

  const EditDetailProduk(
      {super.key,
      required this.img1,
      required this.img2,
      required this.img3,
      required this.title,
      required this.merk,
      required this.harga,
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
      required this.favorit});

  @override
  State<EditDetailProduk> createState() => _EditDetailProdukState();
}

class _EditDetailProdukState extends State<EditDetailProduk> {
  String imgURL1 = '';
  File? imageFix1;

  String imgURL2 = '';
  File? imageFix2;

  String imgURL3 = '';
  File? imageFix3;

  TextEditingController titleC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController hargaC = TextEditingController();
  TextEditingController kondisiC = TextEditingController();
  TextEditingController kodeplatC = TextEditingController();
  TextEditingController kilometerC = TextEditingController();
  TextEditingController warnaC = TextEditingController();
  TextEditingController tahunC = TextEditingController();

  bool? favorit;

  String dropdownvalueMerk = 'Toyota';
  var merk = [
    'Toyota',
    'Honda',
    'Mercedes Bens',
  ];

  String dropdownvalueBahanbakar = 'Bensin';
  var bahan_bakar = [
    'Bensin',
    'Solar',
    'Listrik',
  ];

  String dropdownvaluePlat = 'Ganjil';
  var plat = [
    'Ganjil',
    'Genap',
  ];

  String dropdownvalueTanganke = 'Pertama';
  var tangan_ke = [
    'Pertama',
    'Kedua',
  ];

  String dropdownvaluePajak = 'Aktif';
  var pajak = [
    'Aktif',
    'Tidak Aktif',
  ];

  String dropdownvalueGarasi = 'Aktif';
  var garasi = [
    'Aktif',
    'Tidak Aktif',
  ];

  String dropdownvalueKelengkapansurat = 'Lengkap';
  var kelengkapan_surat = [
    'Lengkap',
    'Tidak lengkap',
  ];

  String dropdownvalueStatus = 'Ready';
  var status = [
    'Ready',
    'Belum Ready',
  ];

  String dropdownvalueKelengkapanunit = 'Lengkap';
  var kelengkapan_unit = [
    'Lengkap',
    'Tidak lengkap',
  ];

  Future updateProduk() async {
    final doc =
        // ignore: unnecessary_string_interpolations
        FirebaseFirestore.instance.collection('product').doc('${titleC.text}');
    doc.update({
      'img1': imgURL1 == '' ? widget.img1 : imgURL1,
      'img2': imgURL2 == '' ? widget.img2 : imgURL2,
      'img3': imgURL3 == '' ? widget.img3 : imgURL3,
      'title': titleC.text,
      'lokasi': lokasiC.text,
      'harga': hargaC.text,
      // harga_kost: NumberFormat.currency(
      //   locale: 'id',
      //   symbol: 'Rp ',
      // ).format(int.parse(hargaC.text)).toString(),
      'merk': dropdownvalueMerk,
      'kondisi': kondisiC.text,
      'kode_plat': kodeplatC.text,
      'kilometer': kilometerC.text,
      'warna': warnaC.text,
      'tahun': tahunC.text,
      'bahan_bakar': dropdownvalueBahanbakar,
      'plat': dropdownvaluePlat,
      'tangan_pertama_kedua': dropdownvalueTanganke,
      'pajak': dropdownvaluePajak,
      'garasi': dropdownvalueGarasi,
      'kelengkapan_surat': dropdownvalueKelengkapansurat,
      'status': dropdownvalueStatus,
      'kelengkapan_unit': dropdownvalueKelengkapanunit,
      'favorit': favorit
    });
  }

  @override
  void initState() {
    titleC.text = widget.title;
    lokasiC.text = widget.lokasi;
    hargaC.text = widget.harga;
    lokasiC.text = widget.lokasi;
    kondisiC.text = widget.kondisi;
    kodeplatC.text = widget.kodeplat;
    kilometerC.text = widget.kilometer;
    warnaC.text = widget.warna;
    tahunC.text = widget.tahun;
    dropdownvalueMerk = widget.merk;
    dropdownvalueBahanbakar = widget.bahan_bakar;
    dropdownvaluePlat = widget.plat;
    dropdownvalueTanganke = widget.tangan_pertama_kedua;
    dropdownvaluePajak = widget.pajak;
    dropdownvalueGarasi = widget.garasi;
    dropdownvalueKelengkapansurat = widget.kelengkapan_surat;
    dropdownvalueStatus = widget.status;
    dropdownvalueKelengkapanunit = widget.kelengkapan_unit;
    favorit = widget.favorit;
    super.initState();
  }

  @override
  void dispose() {
    titleC.dispose();
    lokasiC.dispose();
    hargaC.dispose();
    kondisiC.dispose();
    kodeplatC.dispose();
    kilometerC.dispose();
    warnaC.dispose();
    tahunC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
              size: 30,
            )),
        title: Text('Edit data kost'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: CarouselSlider(
                    options: CarouselOptions(
                        aspectRatio: 1 / 1,
                        height: MediaQuery.of(context).size.height * 0.3,
                        autoPlay: false,
                        autoPlayInterval: Duration(seconds: 10),
                        autoPlayAnimationDuration: Duration(seconds: 5),
                        disableCenter: false,
                        pauseAutoPlayInFiniteScroll: true,
                        viewportFraction: 0.75,
                        enlargeCenterPage: true),
                    items: [
                      imageFix1 != null
                          ? Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.file(
                                  imageFix1!,
                                  width: double.maxFinite,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 8,
                                      spreadRadius: 1,
                                      offset: Offset(2, 2),
                                      color: Colors.grey.withOpacity(0.2))
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CachedNetworkImage(
                                        imageUrl: widget.img1,
                                        width: double.maxFinite,
                                        height: double.maxFinite,
                                        fit: BoxFit.cover,
                                      )),
                                  Shimmer.fromColors(
                                    baseColor: Colors.white.withOpacity(0.9),
                                    highlightColor: Colors.blue.shade100,
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundColor:
                                          Colors.blue.withOpacity(0.5),
                                      child: IconButton(
                                          onPressed: () async {
                                            ImagePicker imagePicker =
                                                ImagePicker();
                                            XFile? file =
                                                await imagePicker.pickImage(
                                                    source:
                                                        ImageSource.gallery);

                                            Reference referenceRoot =
                                                FirebaseStorage.instance.ref();
                                            Reference referenceDirImages =
                                                referenceRoot.child('images');
                                            Reference referenceImageToUpload =
                                                referenceDirImages.child(
                                                    DateTime.now()
                                                        .microsecondsSinceEpoch
                                                        .toString());
                                            try {
                                              imageFix1 = File(file!.path);

                                              await referenceImageToUpload
                                                  .putFile(imageFix1!);
                                              setState(() {});
                                              imgURL1 =
                                                  await referenceImageToUpload
                                                      .getDownloadURL();
                                              print('LINK GAMBAR : $imgURL1');
                                            } catch (e) {
                                              print('ERROR IMAGE PICKER : $e');
                                            }
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            size: 35,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      //SliderDetail(imgNet),
                      imageFix2 != null
                          ? Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.file(
                                  imageFix2!,
                                  width: double.maxFinite,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 8,
                                      spreadRadius: 1,
                                      offset: Offset(2, 2),
                                      color: Colors.grey.withOpacity(0.2))
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CachedNetworkImage(
                                        imageUrl: widget.img2,
                                        width: double.maxFinite,
                                        height: double.maxFinite,
                                        fit: BoxFit.cover,
                                      )),
                                  Shimmer.fromColors(
                                    baseColor: Colors.white.withOpacity(0.9),
                                    highlightColor: Colors.blue.shade100,
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundColor:
                                          Colors.blue.withOpacity(0.5),
                                      child: IconButton(
                                          onPressed: () async {
                                            ImagePicker imagePicker =
                                                ImagePicker();
                                            XFile? file =
                                                await imagePicker.pickImage(
                                                    source:
                                                        ImageSource.gallery);

                                            Reference referenceRoot =
                                                FirebaseStorage.instance.ref();
                                            Reference referenceDirImages =
                                                referenceRoot.child('images');
                                            Reference referenceImageToUpload =
                                                referenceDirImages.child(
                                                    DateTime.now()
                                                        .microsecondsSinceEpoch
                                                        .toString());
                                            try {
                                              imageFix2 = File(file!.path);

                                              await referenceImageToUpload
                                                  .putFile(imageFix2!);
                                              setState(() {});
                                              imgURL2 =
                                                  await referenceImageToUpload
                                                      .getDownloadURL();
                                              print('LINK GAMBAR : $imgURL2');
                                            } catch (e) {
                                              print('ERROR IMAGE PICKER : $e');
                                            }
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            size: 35,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      //
                      imageFix3 != null
                          ? Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.file(
                                  imageFix3!,
                                  width: double.maxFinite,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 8,
                                      spreadRadius: 1,
                                      offset: Offset(2, 2),
                                      color: Colors.grey.withOpacity(0.2))
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CachedNetworkImage(
                                        imageUrl: widget.img3,
                                        width: double.maxFinite,
                                        height: double.maxFinite,
                                        fit: BoxFit.cover,
                                      )),
                                  Shimmer.fromColors(
                                    baseColor: Colors.white.withOpacity(0.9),
                                    highlightColor: Colors.blue.shade100,
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundColor:
                                          Colors.blue.withOpacity(0.5),
                                      child: IconButton(
                                          onPressed: () async {
                                            ImagePicker imagePicker =
                                                ImagePicker();
                                            XFile? file =
                                                await imagePicker.pickImage(
                                                    source:
                                                        ImageSource.gallery);

                                            Reference referenceRoot =
                                                FirebaseStorage.instance.ref();
                                            Reference referenceDirImages =
                                                referenceRoot.child('images');
                                            Reference referenceImageToUpload =
                                                referenceDirImages.child(
                                                    DateTime.now()
                                                        .microsecondsSinceEpoch
                                                        .toString());
                                            try {
                                              imageFix3 = File(file!.path);

                                              await referenceImageToUpload
                                                  .putFile(imageFix3!);
                                              setState(() {});
                                              imgURL3 =
                                                  await referenceImageToUpload
                                                      .getDownloadURL();
                                              print('LINK GAMBAR : $imgURL3');
                                            } catch (e) {
                                              print('ERROR IMAGE PICKER : $e');
                                            }
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            size: 35,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
                //listview
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title Kost',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      spreadRadius: 3,
                                      color: Colors.grey.withOpacity(0.1),
                                      offset: Offset(2, 1))
                                ],
                                borderRadius: BorderRadius.circular(15)),
                            child: TextField(
                              controller: titleC,
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lokasi',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      spreadRadius: 3,
                                      color: Colors.grey.withOpacity(0.1),
                                      offset: Offset(2, 1))
                                ],
                                borderRadius: BorderRadius.circular(15)),
                            child: TextField(
                              controller: lokasiC,
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Harga',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      spreadRadius: 3,
                                      color: Colors.grey.withOpacity(0.1),
                                      offset: Offset(2, 1))
                                ],
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  child: TextField(
                                    controller: hargaC,
                                    inputFormatters: [
                                      CurrencyTextInputFormatter(
                                          decimalDigits: 0,
                                          locale: 'id',
                                          symbol: 'Rp')
                                    ],
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Informasi detail',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 15, right: 10, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      spreadRadius: 3,
                                      color: Colors.grey.withOpacity(0.1),
                                      offset: Offset(2, 1))
                                ],
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Table(
                                  columnWidths: const {
                                    0: const FlexColumnWidth(1),
                                    1: const FlexColumnWidth(1)
                                  },
                                  children: [
                                    TableRow(children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "Kondisi",
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 23,
                                          child: TextField(
                                            cursorHeight: 17,
                                            controller: kondisiC,
                                            decoration: InputDecoration(
                                                isDense: true,
                                                border: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey)),
                                                contentPadding:
                                                    EdgeInsets.only(bottom: 5)),
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "Kode plat",
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 23,
                                          child: TextField(
                                            cursorHeight: 17,
                                            controller: kodeplatC,
                                            decoration: InputDecoration(
                                                isDense: true,
                                                border: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey)),
                                                contentPadding:
                                                    EdgeInsets.only(bottom: 5)),
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "Kilometer /km",
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 23,
                                          child: TextField(
                                            cursorHeight: 17,
                                            controller: kilometerC,
                                            decoration: InputDecoration(
                                                isDense: true,
                                                border: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey)),
                                                contentPadding:
                                                    EdgeInsets.only(bottom: 5)),
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "Warna",
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 23,
                                          child: TextField(
                                            cursorHeight: 17,
                                            controller: warnaC,
                                            decoration: InputDecoration(
                                                isDense: true,
                                                border: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey)),
                                                contentPadding:
                                                    EdgeInsets.only(bottom: 5)),
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "Tahun",
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 23,
                                          child: TextField(
                                            cursorHeight: 17,
                                            controller: tahunC,
                                            decoration: InputDecoration(
                                                isDense: true,
                                                border: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey)),
                                                contentPadding:
                                                    EdgeInsets.only(bottom: 5)),
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "Merk",
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 22,
                                          child: DropdownButton(
                                            style: TextStyle(fontSize: 10),
                                            isDense: true,
                                            value: dropdownvalueMerk,
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            items: merk.map((String level) {
                                              return DropdownMenuItem(
                                                value: level,
                                                child: Text(
                                                  level,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color:
                                                          Colors.grey.shade600),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownvalueMerk = newValue!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "Bahan bakar",
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 22,
                                          child: DropdownButton(
                                            style: TextStyle(fontSize: 10),
                                            isDense: true,
                                            value: dropdownvalueBahanbakar,
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            items:
                                                bahan_bakar.map((String level) {
                                              return DropdownMenuItem(
                                                value: level,
                                                child: Text(
                                                  level,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color:
                                                          Colors.grey.shade600),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownvalueBahanbakar =
                                                    newValue!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "Plat",
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 22,
                                          child: DropdownButton(
                                            style: TextStyle(fontSize: 10),
                                            isDense: true,
                                            value: dropdownvaluePlat,
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            items: plat.map((String level) {
                                              return DropdownMenuItem(
                                                value: level,
                                                child: Text(
                                                  level,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color:
                                                          Colors.grey.shade600),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownvaluePlat = newValue!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "Tangan ke",
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 22,
                                          child: DropdownButton(
                                            style: TextStyle(fontSize: 10),
                                            isDense: true,
                                            value: dropdownvalueTanganke,
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            items:
                                                tangan_ke.map((String level) {
                                              return DropdownMenuItem(
                                                value: level,
                                                child: Text(
                                                  level,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color:
                                                          Colors.grey.shade600),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownvalueTanganke =
                                                    newValue!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "Pajak",
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 22,
                                          child: DropdownButton(
                                            style: TextStyle(fontSize: 10),
                                            isDense: true,
                                            value: dropdownvaluePajak,
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            items: pajak.map((String level) {
                                              return DropdownMenuItem(
                                                value: level,
                                                child: Text(
                                                  level,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color:
                                                          Colors.grey.shade600),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownvaluePajak = newValue!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "Garasi",
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 22,
                                          child: DropdownButton(
                                            style: TextStyle(fontSize: 10),
                                            isDense: true,
                                            value: dropdownvalueGarasi,
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            items: garasi.map((String level) {
                                              return DropdownMenuItem(
                                                value: level,
                                                child: Text(
                                                  level,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color:
                                                          Colors.grey.shade600),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownvalueGarasi = newValue!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "Kelengkapan surat",
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 22,
                                          child: DropdownButton(
                                            style: TextStyle(fontSize: 10),
                                            isDense: true,
                                            value:
                                                dropdownvalueKelengkapansurat,
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            items: kelengkapan_surat
                                                .map((String level) {
                                              return DropdownMenuItem(
                                                value: level,
                                                child: Text(
                                                  level,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color:
                                                          Colors.grey.shade600),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownvalueKelengkapansurat =
                                                    newValue!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "Status",
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 22,
                                          child: DropdownButton(
                                            style: TextStyle(fontSize: 10),
                                            isDense: true,
                                            value: dropdownvalueStatus,
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            items: status.map((String level) {
                                              return DropdownMenuItem(
                                                value: level,
                                                child: Text(
                                                  level,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color:
                                                          Colors.grey.shade600),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownvalueStatus = newValue!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "Kelengkapan unit",
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 22,
                                          child: DropdownButton(
                                            style: TextStyle(fontSize: 10),
                                            isDense: true,
                                            value: dropdownvalueKelengkapanunit,
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            items: kelengkapan_unit
                                                .map((String level) {
                                              return DropdownMenuItem(
                                                value: level,
                                                child: Text(
                                                  level,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color:
                                                          Colors.grey.shade600),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownvalueKelengkapanunit =
                                                    newValue!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          updateProduk();
          AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.success,
            title: 'Data Disimpan',
            btnOkOnPress: () {
              Navigator.pop(context);
            },
          ).show();
        },
        child: Container(
          height: 45,
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 15, bottom: 10, right: 15),
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 5,
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(
                      -3,
                      0,
                    ))
              ]),
          child: Text(
            'Submit',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
