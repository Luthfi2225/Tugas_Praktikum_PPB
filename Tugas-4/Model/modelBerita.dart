class Berita {
  String? judul;
  String? img;
  String? author;
  String? tanggalRilis;

  Berita({required this.judul, this.img, this.author, this.tanggalRilis});

  factory Berita.fromJson(Map<String, dynamic> json) {
    return Berita(
      judul: json['title'] as String,
      img: json['urlToImage'],
      author: json['author'],
      tanggalRilis: json['publishedAt']
    );
  }
}
