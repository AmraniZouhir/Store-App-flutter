import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:storeapp/consts/global_colors.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListTile(
      leading: FancyShimmerImage(
        height: size.height * 0.15,
        width: size.width * 0.15,
        errorWidget: Icon(
          IconlyBold.danger,
          color: Colors.red,
        ),
        imageUrl:
            "https://media.istockphoto.com/id/1171169099/fr/photo/homme-avec-les-bras-crois%C3%A9s-disolement-sur-le-fond-gris.jpg?s=612x612&w=0&k=20&c=csQeB3utGtrGeb3WmdSxRYXaJvUy_xqlhbOIZxclcGA=",
        boxFit: BoxFit.fill,
      ),
      title: Text("user name"),
      subtitle: Text('email@gmail.com'),
      trailing: Text(
        'user role ',
        style: TextStyle(color: lightIconsColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
