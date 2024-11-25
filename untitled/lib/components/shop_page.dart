

import 'package:flutter/material.dart';
class shopPage extends StatefulWidget {
  const shopPage({super.key});

  @override
  State<shopPage> createState() => _shopPageState();
}

class _shopPageState extends State<shopPage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${_selectedDate.year} - ${_selectedDate.month} - ${_selectedDate.day}",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20,),
          MaterialButton(
            onPressed: () async{
              final DateTime? dateTime = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3000)
              );
              if(dateTime != null){
                setState(() {
                  _selectedDate = dateTime;
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Choose Date",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
