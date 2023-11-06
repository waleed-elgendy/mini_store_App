import 'package:store_app/helper/api.dart';

class GetAllCategories {
  Future<List> getAllCategories() async {
    List<dynamic> categoriesList =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    return categoriesList;
  }
}
