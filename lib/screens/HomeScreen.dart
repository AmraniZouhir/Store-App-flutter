import 'package:flutter/material.dart';
import 'package:storeapp/widgets/appBar_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          leading: AppBarIcons(),
        ),
        body: Center(
          child: Text('data'),
        ),
      ),
    );
  }
}
