// 1. buatlah  function untuk  menghitung jumlah barang yang  kita  beli  dari sebuah toko
var buku = 10000;
var pensil = 5000;
var tas = 100000;

jumlah_Barang(int buku, int pensil, int tas) {
  var hasil;
  hasil = buku + pensil + tas;
  print("Hasilnya adalah $hasil");
}

void main() {
  jumlah_Barang(buku, pensil, tas);
}
