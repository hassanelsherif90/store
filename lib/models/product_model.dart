class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final RatingModel? ratingModel;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ratingModel,
  });

  factory ProductModel.fromjson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData["image"],
      ratingModel: jsonData['rating'] == null
          ? null
          : RatingModel.fromjson(jsonData['rating']),
    );
  }
}

class RatingModel {
  final dynamic rate;
  final dynamic count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromjson(jsonData) {
    return RatingModel(
      rate: jsonData['rate'],
      count: jsonData['count'],
    );
  }
}
