import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class CategoriesService {
  Future<List<ProductModel>> getCategory({required String categoryName}) async {
    List<dynamic> data = await Api().get(
        url: 'https://fakestoreapi.com/products/category/$categoryName',
        token: '');

    List<ProductModel> productList = [];

    for (var i = 0; i < data.length; i++) {
      productList.add(
        ProductModel.fromjson(data[i]),
      );
    }

    return productList;
  }
}
