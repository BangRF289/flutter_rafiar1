// ignore: unused_import
import 'dart:math';

luas_Lingkaran(jariJari) {
  double hasil1;
  hasil1 = 3.14 * jariJari * jariJari;
  print("Luas = ${hasil1.toStringAsFixed(2)}");

  var hasil2;
  hasil2 = 2 * 3.14 * jariJari;
  print("Keliling = $hasil2");
}

keliling_Luas_Persegi_Panjang(panjang, lebar) {
  var hasil1;
  hasil1 = 2 * (panjang + lebar);
  print("Keliling = $hasil1");

  var hasil2;
  hasil2 = panjang * lebar;
  print("Luas = $hasil2");
}

penggabungan_Variabel() {
  String a = "Rafi";
  String b = "Ar";
  String c = "Rafi'i";
  print("$a $b $c");
}

rumus_Volume_Tabung(jariJari, tinggi) {
  double hasil1;
  hasil1 = 3.14 * (jariJari * jariJari) * tinggi;
  print("Volume = $hasil1");
}

void main() {
  print("####################################");
  print("Soal Prioritas 1 (80)");
  print("************************************");
  print("Keliling Dan Luas Persegi Panjang");
  keliling_Luas_Persegi_Panjang(5, 8);
  print("************************************");
  print("Keliling Dan Luas Lingkaran");
  luas_Lingkaran(8);
  print("####################################");
  print("Soal Prioritas 2 (20)");
  print("************************************");
  print("Penggabungan Variabel");
  penggabungan_Variabel();
  print("************************************");
  print("Volume Tabung");
  rumus_Volume_Tabung(4, 8);
}
