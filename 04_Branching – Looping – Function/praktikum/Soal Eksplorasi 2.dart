// No.2
import 'dart:io';

tabelPerkalian(int angka) {
  for (int i = 1; i <= angka; i++) {
    for (int j = 1; j <= angka; j++) {
      var hasil = i * j;
      stdout.write("$hasil \t");
    }
    stdout.writeln("");
  }
}

void main() {
  stdout.write("Masukkan angka untuk tabel perkalian: ");
  var angka = int.parse(stdin.readLineSync()!);
  tabelPerkalian(angka);
}
