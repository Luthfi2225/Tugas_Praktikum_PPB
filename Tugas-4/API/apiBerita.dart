import 'dart:convert';
import 'package:tugas4/Model/modelBerita.dart';
import 'package:http/http.dart' as http;

class APIservice{
  Future<List<Berita>> fetcBerita() async{
    try {
      final url = Uri.parse('https://newsapi.org/v2/everything?domains=wsj.com&apiKey=71e1ad08dc63489c972ca23d6c32daa1');
      final respon = await http.get(url);

      if(respon.statusCode == 200){
        final Map <String, dynamic> json = jsonDecode(respon.body);
        final List<dynamic> beritaJson = json['articles'];
        return beritaJson.map((json) => Berita.fromJson(json)).toList();
      }else{
        throw Exception("Seuneuna pareum");
      }
    } catch (e) {
      throw Exception("Gagal konek seuneuna pareum");
    }
  }
}