import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => Home(),
    },
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool sun = false;
  bool moon = true;
  bool cloud = false;
  int index = 0;
  List<ImageProvider> image = [
    NetworkImage(
        'https://images.unsplash.com/photo-1470252649378-9c29740c9fa8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80'),
    NetworkImage(
        'https://images.unsplash.com/photo-1562832135-14a35d25edef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1545&q=80'),
    NetworkImage(
        'https://images.unsplash.com/photo-1560773526-435221de2527?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80')
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: image[index], fit: BoxFit.cover),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          colorButton(
            Icon(Icons.sunny),
            Colors.yellow,
            (() {
              setState(() {
                sun = true;
                moon = false;
                cloud = false;
                index = 0;
              });
            }),
            sun,
          ),
          colorButton(Icon(Icons.nightlight), Colors.pinkAccent, () {
            setState(() {
              index = 1;
              sun = false;
              moon = true;
              cloud = false;
            });
          }, moon),
          colorButton(Icon(Icons.cloud), Colors.lightBlueAccent.shade100, () {
            setState(() {
              index = 2;
              sun = false;
              moon = false;
              cloud = true;
            });
          }, cloud),
        ]),
      ),
    );
  }

  Widget colorButton(Icon i, Color c, void function(), bool time) {
    return IconButton(
      onPressed: function,
      icon: i,
      color: time ? c : Colors.grey,
    );
  }
}
