import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/Models/prodacts_model.dart';
import 'package:storeapp/consts/global_colors.dart';
import 'package:storeapp/services/api_handler.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.id});
  final String id;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final titleStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  ProductsModel? productsModel;
  Future<void> getProductInfo() async {
    productsModel = await ApiHandler.getProdactBayId(id: widget.id);
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    getProductInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('Product Details'),
      ),
      body: SafeArea(
          child: productsModel == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (productsModel != null)
                              Text(
                                productsModel!.category.toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
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
                                      productsModel?.title.toString() ?? '',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                    child: RichText(
                                  text: TextSpan(
                                      text: '\$',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(33, 150, 243, 1)),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              productsModel?.price.toString() ??
                                                  '',
                                          style: TextStyle(
                                            color: lightTextColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
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
                          itemCount: productsModel != null ? 3 : 0,
                          itemBuilder: (BuildContext context, int index) {
                            return FancyShimmerImage(
                              width: double.infinity,
                              imageUrl: productsModel?.image.toString() ?? '',
                              boxFit: BoxFit.fill,
                            );
                          },
                          autoplay: true,
                          pagination: const SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                              color: Colors.white,
                              activeColor: Colors.red,
                            ),
                          ),
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
                              productsModel!.description.toString(),
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
