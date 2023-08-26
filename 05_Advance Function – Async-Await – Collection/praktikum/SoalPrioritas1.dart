// Hasil soal Prioritas 1
import 'dart:io';

Future<List<int>> dataPegngali(List<int> listdata, int pengali) async {
  List<int> hasilPerkalian = [];
  await Future.delayed(Duration(seconds: 5));

  for (int angka in listdata) {
    int hasil = angka * pengali;
    hasilPerkalian.add(hasil);
    await Future.delayed(Duration(seconds: 0));
  }
  return hasilPerkalian;
}

void main() async {
  List<int> data = [2, 4, 6, 8, 10];
  stdout.writeln("Data awal $data");
  int pengali = 2;
  List<int> hasil = await dataPegngali(data, pengali);
  stdout.writeln('Data yang sudah dikali  dengan $pengali adalah $hasil');
}
