import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:storeapp/consts/global_colors.dart';
import 'package:storeapp/widgets/appBar_icons.dart';
import 'package:storeapp/widgets/sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text('Home'),
          leading: AppBarIcons(
            fonction: () {},
            icon: IconlyBold.category,
          ),
          actions: [AppBarIcons(fonction: () {}, icon: IconlyBold.user3)],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 18,
              ),
              TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Search',
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            width: 1, color: Theme.of(context).cardColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context).colorScheme.secondary)),
                    suffixIcon: Icon(
                      IconlyLight.search,
                      color: lightIconsColor,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              SaleWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
