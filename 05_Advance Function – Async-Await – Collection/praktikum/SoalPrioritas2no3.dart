// Hasil dari soal Prioritas 2 no 3
import 'dart:async';
import 'dart:io';

Future<int> faktorial(int n) async {
  int hasil = 1;
  for (int i = 1; i <= n; i++) {
    hasil *= i;
    await Future.delayed(Duration(seconds: 2));
  }
  return hasil;
}

void main() async {
  print("Masukkan Nilai Angka : ");
  var angka = int.parse(stdin.readLineSync()!);
  int hasil1 = await faktorial(angka);
  print("Hasil dari faktorial adalah : $hasil1");
}
