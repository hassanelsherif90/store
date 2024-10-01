import 'package:store/helper/api.dart';
import 'package:store/models/categories_model.dart';

class AllCategoriesService {
  Future<List<CategoriesModel>> getAllCategories() async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/categories', token: '');

    List<CategoriesModel> categoryList = [];

    for (var i = 0; i < data.length; i++) {
      categoryList.add(CategoriesModel.fromjson(data[i]));
    }

    return categoryList;
  }
}
