
import 'package:OnTimeDining/database/core/database_manager.dart';
import 'package:flutter/material.dart';

import 'menu/menu_widget.dart';

Color appDarkBlue=const Color(0xff3F497F);
Color appYellow=const Color(0xffF7C04A);

class MainScreen extends StatefulWidget{

  MainScreen();

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }

}
class _MainScreenState extends State<MainScreen>{
  int _activePageIndex=0;

  _MainScreenState();

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children= [
      MenuWidget(),
      Center(child: Text("cart selected but not purchased items " + 1.toString())),
      Center(child: Text("menu available items " + 2.toString()))
    ];


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: appDarkBlue
      ),
      home: Scaffold(
        floatingActionButton: null,
        body:_children[_activePageIndex] ,
        bottomNavigationBar:
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0.5,
          backgroundColor: appDarkBlue ,
          selectedItemColor: appYellow,
          unselectedItemColor: Colors.white,
          onTap: (value) {
            setState(() {
              _activePageIndex=value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              //I want to navigate to a new page Library();
              icon: Icon(Icons.person),
              label: 'profile',
            ),
            BottomNavigationBarItem(
              //I want to navigate to a new page Store();
              icon: Icon(Icons.shopping_cart),
              label: 'cart',
            ),
            BottomNavigationBarItem(
              //I want to navigate to a new page Profile();
              icon: Icon(Icons.delivery_dining),
              label: 'deliveries',
            ),
          ],
        )
      ),
    );
  }

}