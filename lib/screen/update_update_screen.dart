import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/update_product.dart';
import 'package:store/widget/custom_botton.dart';
import 'package:store/widget/custom_text_field.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});

  static String id = 'UpdateProductScreen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, description, image, price;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Product'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  onChange: (data) {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChange: (data) {
                    description = data;
                  },
                  hintText: 'description',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  inputType: TextInputType.number,
                  onChange: (data) {
                    price = data;
                  },
                  hintText: 'price',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChange: (data) {
                    image = data;
                  },
                  hintText: 'image',
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButtonWidget(
                  onTap: () {
                    isLoading = true;
                    setState(() {});
                    updateProduct(productModel);
                    try {
                      updateProduct(productModel);
                      // ignore: avoid_print
                      print(productModel.title);
                    } catch (e) {
                      // ignore: avoid_print
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                  title: 'Update',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel productModel) async {
    await UpdateProductServices().updateProduct(
      id: productModel.id.toString(),
      title: productName != null ? productName! : productModel.title,
      price: price != null ? price!.toString() : productModel.price.toString(),
      desc: description != null ? description! : productModel.description,
      image: image != null ? image! : productModel.image,
      category: productModel.category,
    );
  }
}
