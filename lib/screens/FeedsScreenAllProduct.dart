import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/Models/prodacts_model.dart';
import 'package:storeapp/services/api_handler.dart';
import 'package:storeapp/widgets/feeds_widget.dart';

class FeedsScreenAllProduct extends StatefulWidget {
  FeedsScreenAllProduct({super.key});

  @override
  State<FeedsScreenAllProduct> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreenAllProduct> {
  List<ProductsModel> prodactsList = [];

  @override
  void didChangeDependencies() {
    getAllProdacts();
    super.didChangeDependencies();
  }

  Future<void> getAllProdacts() async {
    prodactsList = await ApiHandler.getAllProdact();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('All Products'),
      ),
      body: prodactsList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              // shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: prodactsList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,
                  childAspectRatio: 0.6),
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                    value: prodactsList[index], child: FeedsWidget());
              },
            ),
    );
  }
}
