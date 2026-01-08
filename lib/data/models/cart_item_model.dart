class CartItem {
  final String cartId;
  final String productId;
  final String name;
  final double price;
  final int quantity;

  CartItem({
    required this.cartId,
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      cartId: json['id'],
      productId: json['products']['id'],
      name: json['products']['name'],
      price: (json['products']['price'] as num).toDouble(),
      quantity: json['quantity'],
    );
  }
}
