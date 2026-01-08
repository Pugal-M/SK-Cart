import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/product_model.dart';

class ProductService {
  final _client = Supabase.instance.client;

  Future<List<Product>> fetchProducts() async {
    final res = await _client
        .from('products')
        .select()
        .order('created_at', ascending: false);

    return (res as List)
        .map((e) => Product.fromJson(e))
        .toList();
  }
}
