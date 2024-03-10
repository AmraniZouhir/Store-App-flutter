import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:storeapp/consts/global_colors.dart';

class CategoreyWidgets extends StatelessWidget {
  final String categoryName;
  final String imageUrl;
  final VoidCallback onTap;

  const CategoreyWidgets({
    Key? key,
    required this.categoryName,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  height: size.height * 0.2,
                  width: size.height * 0.2,
                  errorWidget: Icon(
                    IconlyBold.danger,
                    color: Colors.red,
                  ),
                  imageUrl: imageUrl,
                  boxFit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: lightCardColor.withOpacity(0.5),
                border: Border.all(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
