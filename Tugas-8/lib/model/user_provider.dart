import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  String nama = "Luthfi Ferdinan Muslih";
  String kelas = "IF'C23";
  String npm = "5520123087";

  UserProvider() {
    loadData();
  }

  // LOAD DATA
  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();

    nama = prefs.getString("nama") ?? nama;
    kelas = prefs.getString("kelas") ?? kelas;
    npm = prefs.getString("npm") ?? npm;

    notifyListeners();
  }

  // SAVE NAMA
  Future<void> saveNama(String value) async {
    final prefs = await SharedPreferences.getInstance();
    nama = value;
    await prefs.setString("nama", value);
    notifyListeners();
  }

  // SAVE KELAS
  Future<void> saveKelas(String value) async {
    final prefs = await SharedPreferences.getInstance();
    kelas = value;
    await prefs.setString("kelas", value);
    notifyListeners();
  }

  // SAVE NPM
  Future<void> saveNpm(String value) async {
    final prefs = await SharedPreferences.getInstance();
    npm = value;
    await prefs.setString("npm", value);
    notifyListeners();
  }
}