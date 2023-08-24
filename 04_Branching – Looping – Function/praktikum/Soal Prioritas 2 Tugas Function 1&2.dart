// No.1
import 'dart:io';

luas_Lingkaran(double jariJari) {
  double hasil;
  hasil = 3.14 * jariJari * jariJari;
  return hasil;
}

void main() {
  print("Masukkan Angka Jari Jari: ");
  double r = double.parse(stdin.readLineSync()!);
  double hasil = luas_Lingkaran(r);
  print("Hasilnya adalah  ${hasil}");
}


// No.2
// import 'dart:io';

// faktorial(int nomer) {
//   if (nomer == 1) {
//     return 1;
//   }
//   return faktorial(nomer - 1) * nomer;
// }

// main() {
//   print("Masukkan Angkanya : ");
//   var a = int.parse(stdin.readLineSync()!);
//   var b = int.parse(stdin.readLineSync()!);
//   var c = int.parse(stdin.readLineSync()!);
//   print('Faktorial dari nilai $a adalah ${faktorial(a)}');
//   print('Faktorial dari nilai $b adalah ${faktorial(b)}');
//   print('Faktorial dari nilai $c adalah ${faktorial(c)}');
// }