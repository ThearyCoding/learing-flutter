import 'package:flutter/material.dart';


class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                color: Color(0xFF525252),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height, // Adjust the height as needed
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFF525252),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(
                                  Icons.question_mark_outlined,
                                  color: Colors.black,
                                ),
                              ),
                              title: Text(
                                "ទំនាក់ទំនង",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.facebook),
                                onPressed: (){}
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFF525252),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Icon(
                                Icons.warning_amber_sharp,
                                color: Colors.blue,
                              ),
                              title: Text(
                                "បញ្ញា/មតិយោបល់",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFF525252),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Icon(
                                Icons.android_outlined,
                                color: Colors.blue,
                              ),
                              title: Text(
                                "ទាញយកកម្មវីធីតាម play store & app store",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 400,
                            margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFF525252),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          color: Colors.blueAccent,
                                          icon: Icon(Icons.emoji_emotions_outlined),
                                          onPressed: () {},
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10, right: 10),
                                          child: Text(
                                            "អំពីពួគយើង",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      alignment: Alignment.center,
                                      child: Text(
                                        """Bac 12 គឺជាកម្មវីធីទូរសព្ទអភិវឌ្ឍឡើងជាពិសេសសម្រាប់សិស្សានុសិស្សទាំងអស់ប្រើប្រាស់សម្រាប់គិតគណនាពិន្ទុប្រឡងសញ្ញាបត្រមធ្យមសិក្សាទុតិភូមិ(បាក់ឌុប)ទាំងបេក្ខជនត្រៀមប្រឡងថ្នាក់វិទ្យាសាស្រ្ត , សង្គម និង ខាងពុទ្ធិកមធ្យមសិក្សាទុតិយភូមិ។ Bac 12 សង្ឃឹមថានិងចូលរួមចំណែកដ៏តូចមួយក្នុងការត្រៀមខ្លួនរបស់អ្នកសិក្សាក្នុងការប្រឡងនាពេលខាងមុខ ។ Bac 12 សូមជូនពរអោយអ្នកប្រើប្រាស់ទទួលបានលទ្ធផលនៃការប្រឡងសញ្ញាបត្រមធ្យមសិក្សាទុតិយភូមិអោយបានដូចបំណងប្រាថ្នា។
                        """,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 90),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "- Email: theary.dev@gmail.com",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15
                                            ),
                                          ),
                                          Text(
                                            "- FaceBook: Thea Ry",
                                            style: TextStyle(
                                              color: Colors.white,
                                                fontSize: 15
                                            ),
                                          ),
                                              Text(
                                                " - Version: 1.0.0",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                    fontSize: 15
                                                ),
                                              ),


                                        ],
                                      )
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 120,
                      child: Container(
                        width: 200, // Set your desired width
                        height: 40, // Set your desired height
                        decoration: BoxDecoration(
                          color: Colors.blue, // Set your desired color
                          borderRadius: BorderRadius.circular(10), // Optional: Add border radius for rounded corners
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent, // Set button background color to transparent
                          ),
                          child: const Text('ចាកចេញ', style: TextStyle(color: Colors.white)), // Set text color
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            );
          },
        );
      },
      icon: Icon(
        Icons.info,
        size: 40,
        color: Colors.white,
      ),
    );

  }
}
