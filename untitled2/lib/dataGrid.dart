import 'package:flutter/material.dart';

class DataGrid extends StatefulWidget {
  const DataGrid({super.key});

  @override
  State<DataGrid> createState() => _DataGridState();
}

class _DataGridState extends State<DataGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: ListView(
          children: [
            Text("Search Something!"),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
