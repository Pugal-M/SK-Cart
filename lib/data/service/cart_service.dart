import 'package:myapp/data/models/cart_item_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CartService {
  final _client = Supabase.instance.client;

  Future<List<CartItem>> fetchCartItems() async {
    final user = _client.auth.currentUser;
    if (user == null) throw Exception("User not logged in");

    final res = await _client
        .from('cart')
        .select('id, quantity, products(id, name, price)')
        .eq('user_id', user.id);

    return (res as List)
        .map((e) => CartItem.fromJson(e))
        .toList();
  }

  Future<void> addToCart(String productId) async {
    final user = _client.auth.currentUser;
    if (user == null) throw Exception("User not logged in");

    final userId = user.id;

    // Check if product already in cart
    final existing = await _client
        .from('cart')
        .select()
        .eq('user_id', userId)
        .eq('product_id', productId)
        .maybeSingle();

    if (existing == null) {
      // Insert new product
      await _client.from('cart').insert({
        'user_id': userId,
        'product_id': productId,
        'quantity': 1,
      });
    } else {
      // Update quantity
      await _client
          .from('cart')
          .update({'quantity': existing['quantity'] + 1})
          .eq('id', existing['id']);
    }
  }
}
