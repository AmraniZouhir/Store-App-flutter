import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/Models/users_model.dart';
import 'package:storeapp/consts/global_colors.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final UsersModel prodactModeleProvaider = Provider.of<UsersModel>(context);

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
      title: Text(
        "${prodactModeleProvaider.name?.firstname} ${prodactModeleProvaider.name?.lastname}",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
      subtitle: Text(
        '${prodactModeleProvaider.email}',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
      trailing: Text(
        '+${prodactModeleProvaider.phone}',
        style: TextStyle(
            color: lightIconsColor, fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }
}
