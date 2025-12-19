import 'package:flutter/material.dart';
import 'detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Daftar Produk Handphone',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        'title': 'iPhone 13',
        'brand': 'Apple',
        'description':
            'iPhone 13 hadir dengan chip A15 Bionic, kamera sinematik, dan daya tahan baterai lebih lama. Didesain dengan tepi datar dan layar Super Retina XDR yang cerah serta detail.',
        'image':
            'https://images.unsplash.com/photo-1636108840454-8fbe394c7837?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1170',
      },
      {
        'title': 'iPhone 14 Pro',
        'brand': 'Apple',
        'description':
            'iPhone 14 Pro memperkenalkan Dynamic Island dan kamera utama 48 MP. Dengan chip A16 Bionic, perangkat ini menghadirkan performa luar biasa dan efisiensi daya optimal.',
        'image':
            'https://images.unsplash.com/photo-1678685888221-cda773a3dcdb?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1169',
      },
      {
        'title': 'iPhone 15 Pro',
        'brand': 'Apple',
        'description':
            'iPhone 15 Pro menggunakan material titanium yang ringan namun kuat, chip A17 Pro untuk performa gaming tinggi, dan port USB-C pertama di lini iPhone Pro.',
        'image':
            'https://images.unsplash.com/photo-1695048132832-b41495f12eb4?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aXBob25lJTIwMTV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=600',
      },
      {
        'title': 'Samsung Galaxy S23 Ultra',
        'brand': 'Samsung',
        'description':
            'Galaxy S23 Ultra hadir dengan kamera 200 MP, layar Dynamic AMOLED 2X, dan S-Pen bawaan. Didukung Snapdragon 8 Gen 2 for Galaxy untuk performa maksimal.',
        'image':
            'https://images.unsplash.com/photo-1678958274412-563119ec18ab?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c2Ftc3VuZyUyMGdhbGF4eSUyMHMyMyUyMHVsdHJhfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=600',
      },
      {
        'title': 'iPhone SE (3rd Gen)',
        'brand': 'Apple',
        'description':
            'iPhone SE generasi ketiga menghadirkan chip A15 Bionic dalam bodi ringkas dan klasik. Cocok untuk pengguna yang ingin performa tinggi dalam ukuran kecil.',
        'image':
            'https://images.unsplash.com/photo-1598033235726-1ed8b7535194?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aXBob25lJTIwc2V8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=600',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Handphone'),
        centerTitle: true,
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product['image']!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                product['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(product['brand']!),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      title: product['title']!,
                      brand: product['brand']!,
                      description: product['description']!,
                      imageUrl: product['image']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}