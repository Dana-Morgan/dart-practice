class Product {
   String id;
   String name;
   double price;

  static final Map<String, Product> _cache = {};

  Product({
    required this.id,
    required this.name,
    required this.price,
  });

  Product.sale({
    required this.id,
    required this.name,
     this.price = 9,
  });


  factory Product.fromMap(Map<String, dynamic> product) {
    return _cache.putIfAbsent(
      product['id'],
          () => Product(
        id: product['id'],
        name: product['name'],
        price: product['price'].toDouble(),
      ),
    );
  }
}
