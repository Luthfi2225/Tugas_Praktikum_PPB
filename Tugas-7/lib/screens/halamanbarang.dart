import 'package:flutter/material.dart';
import 'package:tugas7/models/barang.dart';
import 'package:tugas7/models/keranjang.dart';
import 'package:tugas7/screens/halamankeranjang.dart';
import 'package:provider/provider.dart';

class HalamanBarang extends StatelessWidget {
  const HalamanBarang({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Barang> listBarang = [
      Barang(
        'Monitor',
        'https://image.made-in-china.com/202f0j00NuHbJezMnroa/24-Inch-LED-Monitor-144Hz-Screen-Refresh-Rate-IPS-FHD-Display-Panel-Dp-HDMI-VGA-Port-Computer-Monitor.webp',
      ),
      Barang(
        'Keyboard',
        'https://row.hyperx.com/cdn/shop/files/hyperx_alloy_origins_60_us_5_top_down_special_renamed_11.jpg?v=1737968262&width=1946',
      ),
      Barang(
        'Mouse',
        'https://img.lazcdn.com/g/p/8270047e4305ccb69c468d91069b13cf.jpg_720x720q80.jpg',
      ),
      Barang(
        'PC Rakitan',
        'https://swalayankomputer.com/wp-content/uploads/2024/04/PC-Rakitan-Bisa-Dirancang-Sesuai-dengan-Kebutuhan.jpg',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Barang'),
        backgroundColor: Colors.greenAccent,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Consumer<Keranjang>(
              builder: (context, value, child) {
                return Badge(
                  label: Text('${value.totalIsi}'),
                  isLabelVisible: value.totalIsi > 0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HalamanKeranjang(),
                        ),
                      );
                    },
                    icon: Icon(Icons.shopping_basket),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: listBarang.length,
        itemBuilder: (context, index) {
          final bar = listBarang[index];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                bar.gambar,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(bar.nama),
            trailing: IconButton(
              onPressed: () {
                Provider.of<Keranjang>(context, listen: false).tambah(bar);
              },
              icon: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
