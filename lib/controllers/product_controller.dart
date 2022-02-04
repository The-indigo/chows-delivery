import 'package:chowsdelivery/models/product_model.dart';
import 'package:chowsdelivery/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductNotifier extends StateNotifier<AsyncValue<List<Product>>> {
  final Reader _read;
  ProductNotifier(this._read) : super(const AsyncValue.data([]));
  List<Product> _products = [];
  Future<void> allProducts() async {
    try {
      state = const AsyncValue.loading();
      _products = await _read(productRepository).getAllProducts();
      state = AsyncValue.data(_products);
      print(_products);
    } catch (e) {
      state = const AsyncValue.error("An error occured fetching");
    }
  }

  void search(String value) {
    List<Product> search = [];
    var oldState = AsyncValue.data(_products);
    if (value.isEmpty) {
      state = oldState;
    } else {
      search = oldState.value!.where((element) => element.name!.toLowerCase().contains(value.toLowerCase())).toList();
      //state = AsyncValue.data(search);
      state = AsyncValue.data([...search]);
    }
  }
}
