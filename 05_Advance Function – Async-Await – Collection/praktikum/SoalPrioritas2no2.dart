// Hasil dari soal Prioritas 2 no 2
void main() {
  List<int> nilai = [7, 5, 3, 5, 2, 1];
  double total = 0;
  for (int nilaiHasil in nilai) {
    total += nilaiHasil;
  }
  double nilaiRata = total / nilai.length;
  int rataBulat = nilaiRata.ceil();

  print("Rata-rata: $rataBulat");
}
