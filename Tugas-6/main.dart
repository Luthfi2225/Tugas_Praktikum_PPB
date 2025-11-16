import 'package:flutter/material.dart';
import 'package:tugas6/model.dart';
import 'detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "KATALOG WISATA",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Katalog Wisata'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list), text: 'List View'),
              Tab(icon: Icon(Icons.grid_on), text: 'Grid View'),
            ],
          ),
        ),
        body: TabBarView(children: [buildListView(), buildGridView()]),
      ),
    );
  }
}

//
// LIST VIEW
//
Widget buildListView() {
  Wisata wisata = Wisata();

  return ListView.builder(
    itemCount: wisata.data.length,
    itemBuilder: (context, index) {
      final item = wisata.data[index];

      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailPage(
                title: item['title']!,
                image: item['image']!,
                desc: item['desc']!,
              ),
            ),
          );
        },
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListTile(
            leading: Image.network(
              item['image']!,
              width: 100,
              fit: BoxFit.cover,
            ),
            title: Text(item['title']!),
            subtitle: Text("Klik untuk detail"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
      );
    },
  );
}

//
// GRID VIEW
//
Widget buildGridView() {
  Wisata wisata = Wisata();

  return GridView.builder(
    padding: EdgeInsets.all(10),
    itemCount: wisata.data.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
    ),
    itemBuilder: (context, index) {
      final item = wisata.data[index];

      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailPage(
                title: item['title']!,
                image: item['image']!,
                desc: item['desc']!,
              ),
            ),
          );
        },
        child: Card(
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: Image.network(item['image']!, fit: BoxFit.cover)),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  item['title']!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}