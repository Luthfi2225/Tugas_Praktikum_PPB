// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tugas4/API/apiBerita.dart';
import 'package:tugas4/Model/modelBerita.dart';

void main() {
  runApp(DaftarBerita());
}

class DaftarBerita extends StatelessWidget {
  const DaftarBerita({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Berita",
      home: TampilanDaftarBerita(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TampilanDaftarBerita extends StatefulWidget {
  const TampilanDaftarBerita({super.key});

  @override
  State<TampilanDaftarBerita> createState() => _TampilanDaftarBeritaState();
}

class _TampilanDaftarBeritaState extends State<TampilanDaftarBerita> {
  late Future<List<Berita>> _berita;

  @override
  void initState() {
    super.initState();
    _berita = APIservice().fetcBerita();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Berita"),
        backgroundColor: const Color.fromARGB(255, 0, 132, 255),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 3, width: 450, child: Divider(thickness: 3)),

            Text("List Berita", style: TextStyle(fontSize: 20)),

            SizedBox(height: 3, width: 450, child: Divider(thickness: 3)),

            Expanded(
              child: FutureBuilder(
                future: _berita,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    final Beritaa = snapshot.data!;
                    return ListView.builder(
                      itemCount: Beritaa.length,
                      itemBuilder: (context, index) {
                        final berita = Beritaa[index];
                        return Card(
                          child: SizedBox(
                            height: 130,
                            child: Center(
                              child: ListTile(
                                leading: SizedBox(
                                  width: 100,
                                  height: 50,
                                  child: Image(
                                    image: NetworkImage(berita.img!),
                                  ),
                                ),
                                title: Text(berita.judul!),
                                subtitle: Text(
                                  "${berita.tanggalRilis!} --- ${berita.author!}",
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Text(
                      "Data Berita Tidak Tersedia, Coba hubungi Admin!!",
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
