import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'gridview_with_parameters.dart';

class KatagoriPlat extends StatelessWidget {
  const KatagoriPlat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plat'),
      ),
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Utils.parameters_key = 'plat';
                Utils.parameters_value = 'Ganjil';
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GridviewWithParameters(),
                    ));
              },
              title: Text(
                'Ganjil',
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              onTap: () {
                Utils.parameters_key = 'plat';
                Utils.parameters_value = 'Genap';
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GridviewWithParameters(),
                    ));
              },
              title: Text(
                'Genap',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
