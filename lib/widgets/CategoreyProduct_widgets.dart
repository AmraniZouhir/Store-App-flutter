// import 'package:flutter/material.dart';
// import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:provider/provider.dart';
// import 'package:storeapp/Models/prodacts_model.dart';
// import 'package:storeapp/consts/global_colors.dart';
// import 'package:storeapp/screens/product_details.dart';

// class CategoryProductWidgets extends StatelessWidget {
//   const CategoryProductWidgets({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final ProductsModel productModelProvider =
//         Provider.of<ProductsModel>(context);

//     Size size = MediaQuery.of(context).size;

//     return Padding(
//       padding: EdgeInsets.all(2.0),
//       child: Material(
//         borderRadius: BorderRadius.circular(8.0),
//         color: Theme.of(context).cardColor,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(8.0),
//           onTap: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ProductDetails(
//                     id: productModelProvider.id.toString(),
//                   ),
//                 ));
//           },
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(left: 5, right: 5, top: 8),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Flexible(
//                       child: RichText(
//                         text: TextSpan(
//                           text: '\$',
//                           style: TextStyle(
//                             color: Color.fromRGBO(33, 150, 243, 1),
//                           ),
//                           children: <TextSpan>[
//                             TextSpan(
//                               text: '${productModelProvider.price}',
//                               style: TextStyle(color: lightTextColor),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Icon(IconlyBold.heart),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: FancyShimmerImage(
//                   height: size.height * 0.2,
//                   width: double.infinity,
//                   errorWidget: Icon(
//                     IconlyBold.danger,
//                     color: Colors.red,
//                   ),
//                   imageUrl: productModelProvider.image.toString(),
//                   boxFit: BoxFit.fill,
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 12,
//                 ),
//                 child: Text(
//                   productModelProvider.title.toString(),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                   style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
//                 ),
//               ),
//               SizedBox(
//                 height: size.height * 0.01,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/Models/prodacts_model.dart';
import 'package:storeapp/consts/global_colors.dart';
import 'package:storeapp/screens/product_details.dart';

class CategoryProductWidgets extends StatelessWidget {
  const CategoryProductWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsModel productModelProvider =
        Provider.of<ProductsModel>(context);

    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(2.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    id: productModelProvider.id.toString(),
                  ),
                ));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          text: '\$',
                          style: TextStyle(
                            color: Color.fromRGBO(33, 150, 243, 1),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '${productModelProvider.price}',
                              style: TextStyle(color: lightTextColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Icon(IconlyBold.heart),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  height: size.height * 0.2,
                  width: double.infinity,
                  errorWidget: Icon(
                    IconlyBold.danger,
                    color: Colors.red,
                  ),
                  imageUrl: productModelProvider.image.toString(),
                  boxFit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 12,
                ),
                child: Text(
                  productModelProvider.title.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
