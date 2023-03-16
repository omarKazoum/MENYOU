import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:on_time_dining_flutter/services/notifications_service.dart';

import 'services/database_service.dart';
import 'widgets/main_widget.dart';

String DATABASE_NAME = 'test.db';
late DatabaseService databaseService;
void main() async {
  // await setupNotification();
  runApp(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    databaseService = DatabaseService.getInstance();
    databaseService.init().then((databaseManager) async {
       //databaseService.insertDummyData().then((value) => {
          Future.delayed(Duration(seconds: 2), () {
            WidgetsFlutterBinding.ensureInitialized();
            NotificationService().init();
            setState(() {
              isLoading = false;
            });
          });
       //});
    });
    return isLoading ? loadingWidget() : MainPage();
  }

  loadingWidget() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: 150,
                  height: 150,
                  child: FittedBox(
                      fit: BoxFit.fill, child: Container(decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.4),spreadRadius: 5,
                          blurRadius: 20,
                          offset: Offset(0, 1),)
                      ]
                  ),child: Icon(Icons.restaurant,color: Colors.orange)))),
              Container(

                margin: EdgeInsets.all(25),
                child: Text(
                  "On Time Dinning !",textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.orange, decoration: TextDecoration.none),
                ),
              ),
              Container(child: CircularProgressIndicator(color: Colors.orange,),),
/*
              Container(margin:EdgeInsets.all(10),child: Text('loading...',style: TextStyle(color: Colors.orange,decoration: TextDecoration.none,fontSize: 15),),)
*/
            ],
          ),
        ),
      ),
    );
  }
}
