import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:storeapp/Models/prodacts_model.dart';
import 'package:storeapp/consts/global_colors.dart';
import 'package:storeapp/screens/categorey_Screen.dart';
import 'package:storeapp/screens/feeds_gred.dart';
import 'package:storeapp/screens/FeedsScreenAllProduct.dart';
import 'package:storeapp/screens/user_screen.dart';
import 'package:storeapp/services/api_handler.dart';
import 'package:storeapp/widgets/appBar_icons.dart';
import 'package:storeapp/widgets/categorey_widgets.dart';
import 'package:storeapp/widgets/sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text('Home'),
          leading: AppBarIcons(
            fonction: () {
              Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: CategoriesScreen(),
                  ));
            },
            icon: IconlyBold.category,
          ),
          actions: [
            AppBarIcons(
                fonction: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade, child: UserScreen()));
                },
                icon: IconlyBold.user3)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              // TextField(
              //   controller: _textEditingController,
              //   keyboardType: TextInputType.text,
              //   decoration: InputDecoration(
              //       hintText: 'Search',
              //       filled: true,
              //       fillColor: Theme.of(context).cardColor,
              //       enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10.0),
              //           borderSide: BorderSide(
              //               width: 1, color: Theme.of(context).cardColor)),
              //       focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10.0),
              //           borderSide: BorderSide(
              //               width: 1,
              //               color: Theme.of(context).colorScheme.secondary)),
              //       suffixIcon: Icon(
              //         IconlyLight.search,
              //         color: lightIconsColor,
              //       )),
              // ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: size.height * 0.25,
                      child: Swiper(
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return SaleWidget();
                        },
                        pagination: const SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                                color: Colors.white, activeColor: Colors.red)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          const Text(
                            'Latest Products',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          Spacer(),
                          AppBarIcons(
                              fonction: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FeedsScreenAllProduct()));
                              },
                              icon: IconlyBold.arrowRight2)
                        ],
                      ),
                    ),
                    FutureBuilder<List<ProductsModel>>(
                      future: ApiHandler.getAllProdact(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          Center(
                            child: Text("An error occured ${snapshot.error}"),
                          );
                        } else if (snapshot.data == null) {
                          Center(
                            child: Text("No products has been added yet"),
                          );
                        }
                        return FeedsGride(prodactsList: snapshot.data!);
                      },
                    )
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
