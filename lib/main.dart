import 'package:flutter/material.dart';
import 'package:test_widget/home_widgets.dart';
import 'menu_widgets.dart';

class HelloRect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: Colors.purple,
      height: 50,
      width: 100,
      child: Center(
          child: const Text(
        "let's say hello",
        style:
            TextStyle(fontFamily: 'fantasy', color: Colors.white, fontSize: 10),
      )),
    ));
  }
}

void main() {
  MenuWidget menu1 = MenuWidget();
  HomeWidget homeWidget = HomeWidget();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/menu': (context) => menu1},
      home: Scaffold(
        appBar: AppBar(title: Text("MENYOU™")),
        body: homeWidget,
      )));
}
