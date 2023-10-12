import 'package:deal_app/pages/gridview_with_parameters.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class KatagoriMerk extends StatelessWidget {
  const KatagoriMerk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Merk'),
      ),
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Utils.parameters_key = 'merk';
                Utils.parameters_value = 'Toyota';
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GridviewWithParameters(),
                    ));
              },
              title: Text(
                'Toyota',
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              onTap: () {
                Utils.parameters_key = 'merk';
                Utils.parameters_value = 'Honda';
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GridviewWithParameters(),
                    ));
              },
              title: Text(
                'Honda',
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              onTap: () {
                Utils.parameters_key = 'merk';
                Utils.parameters_value = 'Mercedes Bens';
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GridviewWithParameters(),
                    ));
              },
              title: Text(
                'Mercedes Bens',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
