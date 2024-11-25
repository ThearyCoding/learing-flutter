import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled3/post.dart';
import 'dart:io';

class AddInformation extends StatefulWidget {
  const AddInformation({Key? key}) : super(key: key);

  @override
  State<AddInformation> createState() => _AddInformationState();
}

class _AddInformationState extends State<AddInformation> {
  File? _image;
  final TextEditingController _postController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  void _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _post() {
    if (_postController.text.isNotEmpty) {
      Post newPost = Post(
        text: _postController.text,
        imagePath: _image != null ? _image!.path : null,
        price: _priceController.text,
        description: _descriptionController.text,
        date: DateTime.now(),
      );
      Navigator.pop(context, newPost);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add product"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                child: _image != null
                    ? Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(_image!),
                      fit: BoxFit.cover,
                    ),

                  ),
                  height: 200.0,
                  width: double.infinity,
                )
                    : Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  width: double.infinity,
                  height: 200.0,
                  child: Text(
                    "No found image",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _postController,
                maxLength: 20,
        
                decoration: InputDecoration(
                  hintText: 'Write your post...',
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
        
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                maxLength: 20,
                controller: _priceController,
                decoration: InputDecoration(
                  hintText: "Price",
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                minLines: 1,
                maxLines: 12,
                maxLength: 2500,
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: "description",
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // SizedBox(height: 16.0),
            // ElevatedButton(
            //   onPressed: _post,
            //   child: Text('Post'),
            // ),
            SizedBox(height: 10.0),
            InkWell(
              onTap: _post,
              child: Container(
                width: MediaQuery.of(context).size.width/2.5,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text("Post",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),
                ),
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}
