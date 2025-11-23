import 'package:flutter/material.dart';
import 'package:tugas7/models/barang.dart';

class Keranjang extends ChangeNotifier{
  final List<Barang> _isiKeranjang = [];
  List<Barang> get isiKeranjang => _isiKeranjang;
  int get totalIsi => _isiKeranjang.length;

  void tambah(Barang barang){
    _isiKeranjang.add(barang);
    notifyListeners();
  }

  void hapus(int index) {
    isiKeranjang.removeAt(index);
    notifyListeners();
  }
}