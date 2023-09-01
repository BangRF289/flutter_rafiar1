class Buku {
  int id_Buku;
  String judul;
  int harga;
  String kategori;

  Buku(this.id_Buku, this.harga, this.judul, this.kategori);
}

class TokoBuku {
  List<Buku> daftarBuku = [];

  void tambahbuku(Buku buku) {
    daftarBuku.add(buku);
  }

  List<Buku> getbuku() {
    return daftarBuku;
  }

  void hapusBuku(Buku buku) {
    daftarBuku.remove(buku);
  }
}

void main() {
  TokoBuku tokobuku = TokoBuku();
  Buku bukuke1 = Buku(001, 20000, 'Kancil', "Anak-Anak");
  Buku bukuke2 = Buku(002, 10000, 'Dart', "Akademik");

  tokobuku.tambahbuku(bukuke1);
  tokobuku.tambahbuku(bukuke2);

  List<Buku> allBooks = tokobuku.getbuku();
  for (var b in allBooks) {
    print(
        "id : ${b.id_Buku} | Harga : ${b.harga} | Judul : ${b.judul} | Kategori : ${b.harga}");
  }

  tokobuku.hapusBuku(bukuke1);
  for (var b in allBooks) {
    print(
        "id : ${b.id_Buku} | Harga : ${b.harga} | Judul : ${b.judul} | Kategori : ${b.harga}");
  }
}
