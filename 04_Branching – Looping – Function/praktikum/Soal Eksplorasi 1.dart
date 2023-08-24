// No. 1
import 'dart:io';

bool bilangan_Prima(int angka) {
  if (angka <= 1) {
    return false;
  }

  for (int i = 2; i <= angka / 2; i++) {
    if (angka % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  print("Masukkan Angkanya : ");
  var angka = int.parse(stdin.readLineSync()!);

  if (bilangan_Prima(angka)) {
    print('$angka Merupakan Bilangan Prima');
  } else {
    print('$angka Bukan Bilangan Prima');
  }
}
