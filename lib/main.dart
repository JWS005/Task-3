import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Grid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductGridScreen(),
    );
  }
}

class ProductGridScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
        name: 'Camera',
        description: 'Capture beautiful moments.',
        imageUrl:
        'https://m.media-amazon.com/images/I/71Is-Zv6A0L._AC_UF894,1000_QL80_.jpg',
        price: 299.99),
    Product(
        name: 'Laptop',
        description: 'High performance for your needs.',
        imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQowEYpF8Rt5nNIADENuHk9j6gcSUnJHiC7Uw&s',
        price: 999.99),
    Product(
        name: 'Headphones',
        description: 'Enjoy music with great sound quality.',
        imageUrl:
        'https://m.media-amazon.com/images/I/61rFE093esL._AC_UF894,1000_QL80_.jpg',
        price: 149.99),
    Product(
        name: 'Smartwatch',
        description: 'Keep track of your fitness goals.',
        imageUrl:
        'https://m.media-amazon.com/images/I/71CMtFGDhxL._AC_UF894,1000_QL80_.jpg',
        price: 199.99),
    Product(
        name: 'Sunglasses',
        description: 'Stylish and protective eyewear.',
        imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3jBGzBKLxK660L-B49681d5B6-YPnizc9gA&s',
        price: 79.99),
    Product(
        name: 'Shoes',
        description: 'Comfortable and trendy footwear.',
        imageUrl:
        'https://m.media-amazon.com/images/I/61-DL6P+HgL._AC_UY900_.jpg',
        price: 89.99),
    Product(
        name: 'Backpack',
        description: 'Durable and spacious for all your essentials.',
        imageUrl:
        'https://m.media-amazon.com/images/I/716-ufSNJ5L._AC_UY1000_.jpg',
        price: 49.99),
    Product(
        name: 'Watch',
        description: 'Elegant timepiece for all occasions.',
        imageUrl:
        'https://m.media-amazon.com/images/I/81H26BNYG+L._AC_UY1000_.jpg',
        price: 159.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 3',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.indigo[400],
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductGridScreen()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        },
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              product.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text('add'),
            ),
          ],
        ),
      ),
    );
  }
}