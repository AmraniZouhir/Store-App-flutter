import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/Models/prodacts_model.dart';
import 'package:storeapp/services/api_handler.dart';
import 'package:storeapp/widgets/CategoreyProduct_widgets.dart';

class CategoreyProduct_screens extends StatefulWidget {
  final String selectedCategory;

  CategoreyProduct_screens({
    super.key,
    required this.selectedCategory,
  });

  @override
  State<CategoreyProduct_screens> createState() =>
      _CategoreyProduct_screensState();
}

class _CategoreyProduct_screensState extends State<CategoreyProduct_screens> {
  List<ProductsModel> prodactsList = [];

  @override
  void didChangeDependencies() {
    getAllProdacts();
    super.didChangeDependencies();
  }

  Future<void> getAllProdacts() async {
    try {
      prodactsList =
          await ApiHandler.getProdactsByCategory(widget.selectedCategory);
      setState(() {});
    } catch (error) {
      print('Error fetching products: $error');
      // Handle the error (show an error message, retry mechanism, etc.)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('Products Category'),
      ),
      body: prodactsList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: prodactsList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0.0,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: prodactsList[index],
                  child: CategoreyProduct_widgets(),
                );
              },
            ),
    );
  }
}
