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
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTopButton = false;

  @override
  void initState() {
    super.initState();
    _berita = APIservice().fetcBerita();

    _scrollController.addListener(() {
      if (_scrollController.offset > 140 && !_showScrollToTopButton) {
        setState(() => _showScrollToTopButton = true);
      } else if (_scrollController.offset <= 140 && _showScrollToTopButton) {
        setState(() => _showScrollToTopButton = false);
      }
    });
  }

  Future<void> _refreshData() async {
    setState(() {
      _berita = APIservice().fetcBerita();
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Berita"),
        backgroundColor: const Color.fromARGB(255, 0, 132, 255),
      ),
      body: Column(
        children: [
          const SizedBox(height: 3, width: 450, child: Divider(thickness: 3)),
          const Text("List Berita", style: TextStyle(fontSize: 20)),
          const SizedBox(height: 3, width: 450, child: Divider(thickness: 3)),

          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshData,
              child: FutureBuilder<List<Berita>>(
                future: _berita,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    final beritaList = snapshot.data!;
                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: beritaList.length,
                      itemBuilder: (context, index) {
                        final berita = beritaList[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 6,
                          ),
                          child: SizedBox(
                            height: 130,
                            child: Center(
                              child: ListTile(
                                leading: SizedBox(
                                  width: 100,
                                  height: 60,
                                  child: Image.network(
                                    berita.img!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  berita.judul!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
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
                    return const Center(
                      child: Text(
                        "Data Berita Tidak Tersedia, Coba hubungi Admin!!",
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: _showScrollToTopButton
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: const Color.fromARGB(255, 0, 132, 255),
              child: const Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}
