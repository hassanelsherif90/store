import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/get_all_product.dart';
import 'package:store/widget/cusom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.cartPlus),
          ),
        ],
        title: const Text(
          'New Trend',
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: AllProductServices().getAllProducts(),
        builder: (context, snapshot) {
          //
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          //
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}  $snapshot'));
          }
          //
          else if (snapshot.hasData && snapshot.data!.isNotEmpty)
          //
          {
            return Padding(
              padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
              child: GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 100,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    productModel: snapshot.data![index],
                  );
                },
              ),
            );
          }
          //
          else {
            return const Center(child: Text('No products available'));
          }
        },
      ),
    );
  }
}
