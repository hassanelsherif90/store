import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/screen/update_update_screen.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.productModel});
  ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductScreen.id,
            arguments: productModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 40,
                    color: Colors.grey.withOpacity(.2),
                    spreadRadius: 0,
                    offset: const Offset(10, 10)),
              ],
            ),
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          productModel.title.toString().substring(0, 6),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ${productModel.price.toString()}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 32,
            top: -70,
            child: Image.network(
              productModel.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
