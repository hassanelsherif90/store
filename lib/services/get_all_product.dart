import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class AllProductServices {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        // ignore: missing_required_param
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productList = [];

    for (var i = 0; i < data.length; i++) {
      productList.add(
        ProductModel.fromjson(data[i]),
      );
    }

    return productList;
  }
}
