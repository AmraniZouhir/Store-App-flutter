import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/Models/prodacts_model.dart';
import 'package:storeapp/services/api_handler.dart';
import 'package:storeapp/widgets/CategoreyProduct_widgets.dart';

class CategoryProductScreens extends StatefulWidget {
  final String selectedCategory;

  CategoryProductScreens({
    Key? key,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  State<CategoryProductScreens> createState() => _CategoryProductScreensState();
}

class _CategoryProductScreensState extends State<CategoryProductScreens> {
  List<ProductsModel> allProducts = [];
  List<ProductsModel> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  Future<void> getAllProducts() async {
    try {
      allProducts = await ApiHandler.getAllProdact();
      filterProductsByCategory();
    } catch (error) {
      print('Error fetching all products: $error');
    }
  }

  void filterProductsByCategory() {
    filteredProducts = allProducts
        .where((product) =>
            product.category!.toLowerCase() ==
            widget.selectedCategory.toLowerCase())
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('Products - ${widget.selectedCategory}'),
      ),
      body: filteredProducts.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: filteredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0.0,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: filteredProducts[index],
                  child: CategoryProductWidgets(),
                );
              },
            ),
    );
  }
}
