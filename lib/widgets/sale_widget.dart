import 'package:flutter/material.dart';

class SaleWidget extends StatelessWidget {
  const SaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 133, 27, 175),
              Color.fromARGB(255, 96, 97, 165),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 212, 143, 240),
                    borderRadius: BorderRadius.circular(18)),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Get the special discount',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Flexible(
                          child: SizedBox(
                        width: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text(
                            '80 %\nOFF',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(14.0),
                child: Image.network(
                    width: double.infinity,
                    'https://i.ibb.co/vwB46Yq/shoes.png'),
              ))
        ],
      ),
    );
  }
}
