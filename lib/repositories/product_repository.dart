import 'package:chowsdelivery/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepository {
  final firestore = FirebaseFirestore.instance;

  Future<List<Product>> getAllProducts() async {
    List<Product> allProducts = [];
    try {
      var productsCollection = firestore.collection('products');
      QuerySnapshot<Map<String, dynamic>> query = await productsCollection.get();
      List<Map<String, dynamic>> queryData = query.docs.map((e) => e.data()).toList();
      for (var product in queryData) {
        allProducts.add(Product.fromJson(product));
      }
    } catch (e) {
      rethrow;
    }
    return allProducts;
  }
}


//   Future<List<Vendor>> getVendorsInCategory(String category) async {
//   List<Vendor> vendors = [];
//   try {
//     var vendorsCollection = firestore.collection('vendors');
//     QuerySnapshot<Map<String, dynamic>> query = await vendorsCollection.where('category', isEqualTo: category).get();
//     List<Map<String, dynamic>> queryData = query.docs.map((e) => e.data()).toList();
//     for (var vendor in queryData) {
//       vendors.add(Vendor.fromJson(vendor));
//     }
//   } catch (e) {
//     print(e);
//   }
//   return vendors;
// }
