import 'package:flutter/material.dart';
import 'package:storeapp/Models/prodacts_model.dart';
import 'package:storeapp/widgets/feeds_widget.dart';

class FeedsGride extends StatelessWidget {
  const FeedsGride({super.key, required this.prodactsList});
  final List<productsModel> prodactsList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
          childAspectRatio: 0.7),
      itemBuilder: (context, index) {
        return FeedsWidget(
          imageUrl: prodactsList[index].images![0],
          titele: prodactsList[index].title.toString(),
        );
      },
    );
  }
}
