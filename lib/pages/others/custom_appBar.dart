import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CustomAppBar({Key? key, required this.height}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0, // Adjust elevation as needed
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        padding: EdgeInsets.only(top: height, left: 20, right: 20), // Adjust padding as needed
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/slider.png'),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
              radius: 23,
            ),
          ],
        ),
      ),
    );
  }
}
