import 'package:flutter/material.dart';
import 'package:tugas7/models/keranjang.dart';
import 'package:provider/provider.dart';

class HalamanKeranjang extends StatelessWidget {
  const HalamanKeranjang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang Kamu"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Consumer<Keranjang>(
        builder: (context, value, child) {
          if (value.isiKeranjang.isEmpty) {
            return const Center(child: Text("Keranjang Kamu Kosong"),);
          }
          return ListView.builder(
            itemCount: value.isiKeranjang.length,
            itemBuilder: (context, index) => ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  value.isiKeranjang[index].gambar,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(value.isiKeranjang[index].nama),
              trailing: IconButton(
                onPressed: (){
                  Provider.of<Keranjang>(context, listen: false).hapus(index);
                },
                icon: Icon(Icons.delete)
              ),
            )
          );
        },
      ),
    );
  }
}