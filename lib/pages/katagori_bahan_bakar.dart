import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'gridview_with_parameters.dart';

class KatagoriBahanBakar extends StatelessWidget {
  const KatagoriBahanBakar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bahan Bakar'),
      ),
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Utils.parameters_key = 'bahan_bakar';
                Utils.parameters_value = 'Bensin';
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GridviewWithParameters(),
                    ));
              },
              title: Text(
                'Bensin',
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              onTap: () {
                Utils.parameters_key = 'bahan_bakar';
                Utils.parameters_value = 'Solar';
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GridviewWithParameters(),
                    ));
              },
              title: Text(
                'Solar',
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              onTap: () {
                Utils.parameters_key = 'bahan_bakar';
                Utils.parameters_value = 'Listrik';
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GridviewWithParameters(),
                    ));
              },
              title: Text(
                'Listrik',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
