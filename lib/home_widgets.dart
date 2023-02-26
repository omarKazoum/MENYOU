import 'package:flutter/material.dart';
import 'package:test_widget/menu_widgets.dart';

class HomeWidget extends StatelessWidget {
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  void onGoToMenuClicked() {
    print("object");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(title: Text("MENYOU™")),
            body: SingleChildScrollView(child:Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network("https://media.architecturaldigest.com/photos/590cc6c3b3064307ffee59a4/master/w_3000,h_2000,c_limit/Tallest%20Restaurants%20in%20the%20World%207.jpg"),
                  Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text("Restaurent name",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid atque natus nemo, soluta unde voluptate? Ab, amet asperiores consequuntur delectus eum fugit laborum nam natus pariatur provident rerum sunt unde!"),
                  Center(child: Container(
                    margin: EdgeInsets.all(50),
                    child: Builder(
                        builder: (context) {
                          return ElevatedButton(onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => MenuWidget()));
                          }, child: Text("Go to menu"));
                        }
                    ),),
                  )
                ]))));
  }
}
/*
ElevatedButton(child: Padding(
padding: const EdgeInsets.all(8.0),
child: Text("Go to menu"),
),onPressed: (){
print("hh");
Navigator.push(context,MaterialPageRoute(builder: (context) => MenuWidget()));
}

 */