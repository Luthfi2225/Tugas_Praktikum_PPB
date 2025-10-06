import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'My Biodata'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Card(
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 110, child: Text('Nama', style: TextStyle(fontSize: 20))),
                  Text(': Luthfi Ferdninan Muslih', style: TextStyle(fontSize: 20)),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 110, child: Text('TTL', style: TextStyle(fontSize: 20))),
                  Text(': Jakarta, 22-02-2005', style: TextStyle(fontSize: 20)),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 110, child: Text('Umur', style: TextStyle(fontSize: 20))),
                  Text(': 20 Tahun', style: TextStyle(fontSize: 20)),
                ],
              ),
              const Text(' '),
              Row(
                children: [
                  SizedBox(width: 110, child: Text('Universitas', style: TextStyle(fontSize: 20))),
                  Text(': Suryakancana', style: TextStyle(fontSize: 20)),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 110, child: Text('NPM', style: TextStyle(fontSize: 20))),
                  Text(': 5520123087', style: TextStyle(fontSize: 20)),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 110, child: Text('Kelas', style: TextStyle(fontSize: 20))),
                  Text(': IF\'C23', style: TextStyle(fontSize: 20)),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 110, child: Text('Hobi', style: TextStyle(fontSize: 20))),
                  Text(': Prgramming', style: TextStyle(fontSize: 20)),
                ],
              ),
              const Text(' '),
              Row(
                children: [
                  SizedBox(width: 110, child: Text('Shift', style: TextStyle(fontSize: 20))),
                  Text(': MOBILE-5', style: TextStyle(fontSize: 20)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}