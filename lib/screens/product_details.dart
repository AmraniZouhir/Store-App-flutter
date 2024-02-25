import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/consts/global_colors.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});
  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            const BackButton(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Category',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Flexible(
                              flex: 3,
                              child: Text(
                                'Lorem ipsum',
                                textAlign: TextAlign.start,
                                style: titleStyle,
                              ))),
                      Flexible(
                          child: RichText(
                        text: TextSpan(
                            text: '\$',
                            style: TextStyle(
                                color: Color.fromRGBO(33, 150, 243, 1)),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '168.00',
                                  style: TextStyle(
                                      color: lightTextColor,
                                      fontWeight: FontWeight.bold))
                            ]),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.4,
              child: Swiper(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return FancyShimmerImage(
                    width: double.infinity,
                    imageUrl: "https://i.ibb.co/vwB46Yq/shoes.png",
                    boxFit: BoxFit.fill,
                  );
                },
                autoplay: true,
                pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white, activeColor: Colors.red)),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Descriptoin",
                    style: titleStyle,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Lorim Ipsshwxhgwhcgchydw cxyuhdwgcy2ec ehyeddecc eced eede eded ed2ed c2wcedc 3rfc3rf efv evv efv3rv3r 3cwedyg3rc 2edhcgqwed wdcygcyc akgdascuad cqhwgc',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
