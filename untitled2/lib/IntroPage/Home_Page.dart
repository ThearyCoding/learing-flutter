
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  var imgurl = [
    "https://i.pinimg.com/originals/f1/12/69/f11269b45e561d9612e8962bf635d2d5.png",
    "https://static.vecteezy.com/system/resources/previews/022/598/687/original/tasty-beef-burger-png.png",
    "https://static.vecteezy.com/system/resources/thumbnails/023/828/736/small/cocktail-drink-watercolor-clipart-ai-generated-free-png.png",
    "https://www.pngall.com/wp-content/uploads/5/Summer-Cocktail-PNG.png"
  ];
  var listname = [
    'Sandwiche',
    'Hamburger',
    'Cookie Water',
    'MockTail'

  ];

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      drawer: Drawer(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RefreshIndicator(
          onRefresh: _refresh,
          color: Colors.indigo,
          backgroundColor: Colors.black45,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Good Food.",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12,),
                    Text(
                      "what do you to order today?",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 16,
                      child: TextField(
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 20),
                          prefixIcon: Icon(Icons.search),
                          labelText: 'Search',
                          hintText: 'Enter Text',
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide.none,
                          )
                        ),

                      ),
                    ),
                    SizedBox(height: 15),
                    Text("Food Type : ",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12,),
                  ],
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Container(
                      height: 200,
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              "${imgurl[index]}",
                              height: 100, // Adjust the height as needed
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${listname[index]}",
                                    style: TextStyle(
                                    fontSize: 17,
                                  ),),
                                  Text("Price: \$19.99",
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: 4, // Replace with the actual item count you want
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: GNav(
          rippleColor: Colors.grey[300]!,
          hoverColor: Colors.grey[100]!,
          gap: 16,
          activeColor: Colors.black,
          iconSize: 24,
          duration: Duration(milliseconds: 400),
          tabBackgroundColor: Colors.grey[100]!,
          color: Colors.black,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.favorite_border,
              text: 'Likes',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.account_circle,
              text: 'Profile',
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 1));
  }
}

