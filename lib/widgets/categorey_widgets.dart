import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:storeapp/consts/global_colors.dart';

class CategoreyWidgets extends StatelessWidget {
  const CategoreyWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              height: size.height * 0.2,
              width: size.height * 0.2,
              errorWidget: Icon(
                IconlyBold.danger,
                color: Colors.red,
              ),
              imageUrl:
                  "https://media.istockphoto.com/id/1171169099/fr/photo/homme-avec-les-bras-crois%C3%A9s-disolement-sur-le-fond-gris.jpg?s=612x612&w=0&k=20&c=csQeB3utGtrGeb3WmdSxRYXaJvUy_xqlhbOIZxclcGA=",
              boxFit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "categ Name",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  backgroundColor: lightCardColor.withOpacity(0.5)),
            ),
          )
        ],
      ),
    );
  }
}
