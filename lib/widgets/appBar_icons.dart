import 'package:flutter/material.dart';

class AppBarIcons extends StatelessWidget {
  const AppBarIcons({super.key, required this.fonction, required this.icon});
  final Function fonction;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          fonction();
        },
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).scaffoldBackgroundColor),
          child: Padding(
            padding: EdgeInsets.all(6.0),
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
