
import 'package:flutter/material.dart';
import 'package:on_time_dining_flutter/widgets/cart/cart_actions_widget.dart';
import 'package:on_time_dining_flutter/widgets/cart/cart_widget.dart';
import 'package:on_time_dining_flutter/widgets/orders/orders_widget.dart';
import 'package:on_time_dining_flutter/widgets/restaurants/restaurants_widget.dart';


Color appDarkBlue=const Color(0xff3F497F);
Color appYellow=const Color(0xffF7C04A);

class MainPage extends StatefulWidget{

  MainPage();

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }

}
class _MainPageState extends State<MainPage>{
  int _activePageIndex=2;
  List<String> pageTitles=[];
  _MainPageState();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.pageTitles=[
      'your cart',
      'purchases',
      'restaurants'
    ];
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: Scaffold(
        appBar: AppBar(title: Text(pageTitles.elementAt(_activePageIndex)),),
        floatingActionButton: _activePageIndex==0?CartActionWidget():null,
        body:getPageAtIndex(_activePageIndex),
        bottomNavigationBar:
        BottomNavigationBar(
          currentIndex: _activePageIndex,
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
              //I want to navigate to a new page Store();
              icon: Icon(Icons.shopping_cart),
              label: 'cart',
            ),
            BottomNavigationBarItem(
              //I want to navigate to a new page Profile();
              icon: Icon(Icons.delivery_dining),
              label: 'deliveries',
            ),
            BottomNavigationBarItem(
              //I want to navigate to a new page Library();
              icon: Icon(Icons.home),
              label: 'restaurants',
            ),
          ],
        ),
      ),
    );
  }
  Widget getPageAtIndex(int index){
    switch(index){
      case 0:
        return CartWidget();
      case 1:
        return OrdersListWidget();
      case 2:
        return RestaurantsListWidget();
      default:
        throw ErrorDescription("page index $index not allowed here");
    }
  }
}