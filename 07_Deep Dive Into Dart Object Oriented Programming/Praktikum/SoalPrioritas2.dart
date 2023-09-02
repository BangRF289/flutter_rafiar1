// Soal Prioritas 2 No. 2 & 1
abstract class Matematika {
  int kalkulasi(int a, int b);
}

class KeliatanPersekutuanTerkecil implements Matematika {
  @override
  int kalkulasi(int a, int b) {
    int hasil = a;
    while (hasil % b != 0) {
      hasil += a;
    }
    print("Hasil Kelipatan Persekutuan Terkeci dari $a dan $b adalah $hasil");
    return hasil;
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  @override
  int kalkulasi(int a, int b) {
    int angka1 = a;
    int angka2 = b;
    while (angka2 != 0) {
      int temp = angka2;
      angka2 = angka1 % angka2;
      angka1 = temp;
    }
    print(
        "Hasil dari Faktor Persekutuan Terbesar dari $a dan $b adalah $angka1");
    return angka1;
  }
}

void main() {
  var angka = KeliatanPersekutuanTerkecil();
  angka.kalkulasi(18, 24);

  var angka2 = FaktorPersekutuanTerbesar();
  angka2.kalkulasi(24, 36);
}
