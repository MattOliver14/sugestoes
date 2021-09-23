import 'package:flutter/material.dart';

class DrawerBody extends StatefulWidget {
  @override
  _DrawerBodyState createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 160,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage("assets/profile.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
