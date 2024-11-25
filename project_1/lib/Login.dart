import 'package:flutter/material.dart';
import 'package:project_1/button_login.dart';

class MyLoginScreen extends StatelessWidget {
  const MyLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(70.0),
                bottomRight: Radius.circular(70.0),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: -150,
            right: 0,
            child: Image.asset(
              'lib/asset/Tealive.png',
              width: 200,
              height: 200,
            ),
          ),
          Positioned(
            top: 80,
            left: 0,
            right: -180,
            child: Image.asset(
              "lib/asset/cup.png",
              width: 150,
              height: 150,
            ),
          ),
          CustomScrollView(
            anchor: 0.3,
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.all(20),
                  height: 445,
                  width: double.maxFinite,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          "Login Account",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Name or E-mail ',
                            labelStyle: TextStyle(
                              color: Color(0xFF6200EE),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6200EE)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Passwords',
                            labelStyle: TextStyle(
                              color: Color(0xFF6200EE),
                            ),
                            suffixIcon: Icon(Icons.visibility_rounded),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6200EE)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Is case you forgot password?",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 51, 116, 228),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blueAccent,
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                Size(double.infinity, 50),
                              ),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 130,
                              child: Divider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "OR",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: 130,
                              child: Divider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonLogin(
                                path: 'lib/asset/apple-logo-transparent.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            ButtonLogin(path: 'lib/asset/google.png')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Text("Don't have an account?"),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Register Now",
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
