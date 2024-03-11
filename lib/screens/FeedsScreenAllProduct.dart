import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/Models/prodacts_model.dart';
import 'package:storeapp/consts/global_colors.dart';
import 'package:storeapp/services/api_handler.dart';
import 'package:storeapp/widgets/feeds_widget.dart';

class FeedsScreenAllProduct extends StatefulWidget {
  FeedsScreenAllProduct({Key? key}) : super(key: key);

  @override
  State<FeedsScreenAllProduct> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreenAllProduct> {
  List<ProductsModel> allProductsList = [];
  List<ProductsModel> displayedProductsList = [];

  @override
  void didChangeDependencies() {
    getAllProducts();
    super.didChangeDependencies();
  }

  Future<void> getAllProducts() async {
    allProductsList = await ApiHandler.getAllProdact();
    // Initially, set the displayed products list to all products
    displayedProductsList = List.from(allProductsList);
    setState(() {});
  }

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

  void searchProducts(String query) {
    setState(() {
      displayedProductsList = allProductsList
          .where((product) =>
              product.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('All Products'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.text,
                onChanged: searchProducts,
                decoration: InputDecoration(
                  hintText: 'Search',
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      _textEditingController.clear();
                      searchProducts('');
                    },
                    child: Icon(
                      IconlyLight.search,
                      color: lightIconsColor,
                    ),
                  ),
                ),
              ),
            ),
            displayedProductsList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: displayedProductsList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 0.0,
                      childAspectRatio: 0.6,
                    ),
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                        value: displayedProductsList[index],
                        child: FeedsWidget(),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
