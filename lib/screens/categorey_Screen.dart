import 'package:flutter/material.dart';
import 'package:storeapp/screens/CategoreyProduct_screens.dart';
import 'package:storeapp/widgets/categorey_widgets.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key});

  final List<String> categories = [
    "electronics",
    "jewelry",
    "men's clothing",
    "women's clothing"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('Categories'),
      ),
      body: GridView.builder(
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          String imageUrl = '';
          switch (categories[index]) {
            case "electronics":
              imageUrl =
                  'https://www.polytechnichub.com/wp-content/uploads/2017/04/Electronic.jpg';
              break;
            case "jewelry":
              imageUrl =
                  'https://previews.123rf.com/images/dream04/dream041710/dream04171000192/88337659-gold-jewelry-pendants-bracelets-rings-and-chains.jpg';
              break;
            case "men's clothing":
              imageUrl =
                  'https://previews.123rf.com/images/fabrikacrimea/fabrikacrimea1705/fabrikacrimea170501531/77326266-collage-of-men-s-clothing-isolated-white-background.jpg';
              break;
            case "women's clothing":
              imageUrl =
                  'https://previews.123rf.com/images/appolobay/appolobay1606/appolobay160600026/68689291-collection-collage-of-women-s-clothing-isolated-white-background.jpg';
              break;
          }

          return CategoryWidgets(
            categoryName: categories[index],
            imageUrl: imageUrl,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryProductScreens(
                    selectedCategory: categories[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
