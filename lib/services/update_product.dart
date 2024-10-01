import 'dart:developer';

import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class UpdateProductServices {
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
    required dynamic id,
  }) async {
    // ignore: missing_required_param
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'id': id,
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category,
      },
    );

    // ignore: avoid_print

    log('${data.toString()}');
    return ProductModel.fromjson(data);
  }
}
