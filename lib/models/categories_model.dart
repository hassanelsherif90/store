// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoriesModel {
  final String electronics;
  final String jewelery;
  final String mensclothing;
  final String womensclothing;

  CategoriesModel({
    required this.electronics,
    required this.jewelery,
    required this.mensclothing,
    required this.womensclothing,
  });

  factory CategoriesModel.fromjson(jsonData) {
    return CategoriesModel(
      electronics: jsonData['electronics'],
      jewelery: jsonData['jewelery'],
      mensclothing: jsonData['mensclothing'],
      womensclothing: jsonData['womensclothing'],
    );
  }
}
