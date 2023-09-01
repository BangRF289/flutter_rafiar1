class Mobil {
  int kapasitas;
  List<String> muatan = [];

  Mobil(this.kapasitas);

  bool bisaTambah() {
    return muatan.length <
        kapasitas; // Perbaiki kondisi menjadi < (kurang dari)
  }

  void tambahMuatan(String item) {
    if (bisaTambah()) {
      // Gunakan bisaTambah() yang memeriksa apakah masih bisa menambah muatan
      muatan.add(item);
      print("Sistem sudah ditambahkan $item");
    } else {
      print("storage sudah penuh tidak bisa tambah $item");
    }
  }
}

void main() {
  var tambah = Mobil(5);
  tambah.tambahMuatan("Sapi");
  tambah.tambahMuatan("Kuda");
  tambah.tambahMuatan("Kerbau");
  tambah.tambahMuatan("Unta");
  tambah.tambahMuatan("Kambing");
  tambah.tambahMuatan("Domba");

  print(tambah.muatan);
}
