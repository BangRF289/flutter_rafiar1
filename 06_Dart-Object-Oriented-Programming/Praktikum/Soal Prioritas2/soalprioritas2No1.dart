import 'dart:io';

class Kalkulator {
  int a;
  int b;

  Kalkulator(this.a, this.b);

  int penjumlahan(int a, int b) {
    var hasil1 = a + b;
    return hasil1;
  }

  int pengurangan(int a, int b) {
    var hasil1 = a - b;
    return hasil1;
  }

  int perkalian(int a, int b) {
    var hasil1 = a * b;
    return hasil1;
  }

  String pembagian(int a, int b, decimalPlaces) {
    var hasil1 = a / b;
    return hasil1.toStringAsFixed(decimalPlaces);
  }
}

void main() {
  print("Masukkan nilai a");
  int nilaia = int.parse(stdin.readLineSync() ?? '0');
  print("Masukkan nilai b");
  int nilaib = int.parse(stdin.readLineSync() ?? '0');

  var kalkulator = Kalkulator(nilaia, nilaib);

  int hasil1 = kalkulator.penjumlahan(nilaia, nilaib);
  int hasil2 = kalkulator.pengurangan(nilaia, nilaib);
  int hasil3 = kalkulator.perkalian(nilaia, nilaib);
  String hasil4 = kalkulator.pembagian(nilaia, nilaib, 2);
  print("Hasilnya penjumlahn $nilaia + $nilaib = $hasil1");
  print("Hasilnya penguranga $nilaia - $nilaib = $hasil2");
  print("Hasilnya perkalian $nilaia * $nilaib = $hasil3");
  print("Hasilnya pembagian $nilaia / $nilaib = $hasil4");
}
