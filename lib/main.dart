import "package:flutter/material.dart";
import 'next_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAppExtension(),
    );
  }
}
class MyAppExtension extends StatefulWidget {
  const MyAppExtension({super.key});

  @override
  State<MyAppExtension> createState() => _MyAppExtensionState();
}

class _MyAppExtensionState extends State<MyAppExtension> {
  String buttonName = "click";
  int currentindex = 0;
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("App Title"),
        ),
        body: Center(
          child: currentindex == 0 ?Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      buttonName = "clicked";
                    });
                  },
                  child: Text(buttonName),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context)=> NextPage(),
                    ),
                    );
                  },
                  child: Text(buttonName),
                ),
              ],
            ),
          ):GestureDetector(
            onTap:() {
              setState(() {
                _isClicked = !_isClicked;
              });
            },
            child: _isClicked ? Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1rqvjmxA0KaYp1h0Kjz2qx0xDjJrKao0LgQ&s')
                : Image.network("https://plus.unsplash.com/premium_photo-1666672388644-2d99f3feb9f1?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8anBnfGVufDB8fDB8fHww"),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "Settings", icon: Icon(Icons.settings))
          ],
          currentIndex: currentindex,
          onTap: (int index) {
            setState(() {
              currentindex = index;
            });
          },
        ),
      );
  }
}


