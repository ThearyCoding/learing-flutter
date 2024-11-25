import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
   return SingleChildScrollView(
     child: Container(
       child: Form(
         key: _formKey,
         child: Padding(
           padding: const EdgeInsets.all(16.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               TextFormField(
                 decoration: InputDecoration(
                   labelText: 'Enter Name',
                 ),
                 validator: (value) {
                   if (value!.isEmpty ?? false) {
                     return 'Please enter in field name';
                   }
                   return null;
                 },
                 onSaved: (value) => _name = value as String,
               ),
               TextFormField(
                 decoration: InputDecoration(
                   labelText: 'Enter Email',
                 ),
                 validator: (value) {
                   if (value!.isEmpty ?? false) {
                     return 'Please enter in field email';
                   }
                   return null;
                 },
                 onSaved: (value) => _email = value as String,
               ),
               CheckboxListTile(
                 title: Text("I accept the terms and conditions"),
                 value: _acceptTerms,
                 onChanged: (value) {
                   setState(() {
                     _acceptTerms = value!;
                   });
                 },
               ),
               Container(

                 width: double.infinity,
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                       primary: Colors.deepPurple,
                       elevation: 0,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(12),
                       )
                   ),
                   onPressed: () {
                     if (_formKey.currentState!.validate()) {
                       _formKey.currentState!.save();
                       showDialog(
                         context: context,
                         builder: (context) {
                           return AlertDialog(
                             content: Text(
                                 "Name: $_name\nEmail: $_email\nAccept the terms: $_acceptTerms"),
                           );
                         },
                       );
                     }
                   },
                   child: Text("Submit",
                     style: TextStyle(
                       color: Colors.white,
                     ),
                   ),
                 ),
               )
             ],
           ),
         ),
       ),
     ),
   );
  }
}
