import 'dart:async';

void main() async {
  final repository = ProductRepository();

  // Get all products using Future
  final products = await repository.getAll();

  print('========== EXERCISE 1 ==========');
  print('All products:');

  for (final product in products) {
    print('${product.id} - ${product.name} - \$${product.price}');
  }

  // Listen for new products from Stream
  final subscription = repository.liveAdded().listen((product) {
    print('New product: ${product.name} - \$${product.price}');
  });

  // Add new products in real time
  repository.add(
    Product(id: 3, name: 'Headphones', price: 50),
  );

  repository.add(
    Product(id: 4, name: 'Keyboard', price: 70),
  );

  // Wait for stream events
  await Future.delayed(const Duration(milliseconds: 100));

  await subscription.cancel();
  await repository.dispose();
}

class Product {
  final int id;
  final String name;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.price,
  });
}

class ProductRepository {
  final List<Product> _products = [
    Product(id: 1, name: 'Laptop', price: 1000),
    Product(id: 2, name: 'Mouse', price: 25),
  ];

  // Broadcast allows multiple listeners
  final StreamController<Product> _controller =
      StreamController<Product>.broadcast();

  Future<List<Product>> getAll() async {
    await Future.delayed(const Duration(seconds: 1));
    return _products;
  }

  Stream<Product> liveAdded() {
    return _controller.stream;
  }

  void add(Product product) {
    _products.add(product);
    _controller.add(product);
  }

  Future<void> dispose() async {
    await _controller.close();
  }
}