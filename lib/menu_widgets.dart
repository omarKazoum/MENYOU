import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  Color color;

  IconData icon;

  String text;

  MenuItemWidget(
      {Key? key,
      required Color this.color,
      required IconData this.icon,
      required String this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            child: InkWell(
              onTap: () {
                print("item tapped");
              },
              splashColor: this.color,
              highlightColor: this.color,
              child: Row(
                children: [
                  Icon(this.icon, size: 10.0, color: this.color),
                  Center(
                    child: Text(
                      text,
                      style: TextStyle(color: this.color),
                    ),
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Icon(Icons.favorite),
                      Container(
                        width: 50,
                        height: 50,
                      )
                    ],
                  )
                ],
              ),
            ),
            padding: EdgeInsets.only(right: 5)));
  }
}

class MenuWidget extends StatelessWidget {
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context=context;
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return MenuItemWidget(
            icon: Icons.ac_unit_outlined,
            color: Colors.red,
            text: "this is awsome " + index.toString(),
          );
        });
  }
}
