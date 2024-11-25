import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled2/IntroPage/Home_Page.dart';
import 'package:untitled2/IntroPage/intro_Page_1.dart';
import 'package:untitled2/IntroPage/intro_page_2.dart';
import 'package:untitled2/IntroPage/intro_page_3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  int _currentPage = 0; // Track the current page index
  bool onLastPage = false;
  bool isLoading = false;

  Future<void> _navigateToHomePage() async {
    // Simulate a loading process
    await Future.delayed(Duration(seconds: 2));

    // Hide loading indicator
    setState(() {
      isLoading = false;
    });

    // Pop the loading dialog
    Navigator.pop(context);

    // Navigate to the HomePage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
            onPageChanged: (int page) {
              setState(() {
                onLastPage = (page == 2);
                _currentPage = page;
              });
            },
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    // If not on the last page, navigate to the next page
                    _controller.jumpToPage(2);
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                ),
                onLastPage
                    ? GestureDetector(
                  onTap: () {
                    // Show loading indicator
                    setState(() {
                      isLoading = true;
                    });

                    // Show loading dialog
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 16),
                              Text("Loading..."),
                            ],
                          ),
                        );
                      },
                    );

                    // Navigate to HomePage after 2 seconds
                    _navigateToHomePage();
                  },
                  child: isLoading
                      ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(),
                  )
                      : Text(
                    "Done",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
                    : GestureDetector(
                  onTap: () {
                    // If not on the last page, navigate to the next page
                    if (_currentPage < 2) {
                      _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    }
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
