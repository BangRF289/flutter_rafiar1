// 1. buatlah  function untuk  menghitung jumlah barang yang  kita  beli  dari sebuah toko
var buku = 10000;
var pensil = 5000;
var tas = 100000;

jumlah_Barang(int buku, int pensil, int tas) {
  var hasil;
  hasil = buku + pensil + tas;
  var diskon = hasil * 0.10;
  var hargaDiskon = hasil - diskon;
  print("Hasilnya adalah $hargaDiskon");
}

void main() {
  jumlah_Barang(buku, pensil, tas);
}
