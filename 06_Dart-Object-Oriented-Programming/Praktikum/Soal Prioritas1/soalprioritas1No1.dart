class Hewan {
  int beratHewan = 0;

  Hewan(int berat) {
    if (berat > 0) {
      beratHewan = berat;
    } else {
      throw ("Tidak Valid");
    }
  }

  int get beratBadan => beratHewan;
  set beratBadan(int berat) {
    if (berat > 0) {
      beratBadan = berat;
    }
  }
}

void main() {
  var kucing = Hewan(7);
  print("Berat kucing ini adalah ${kucing.beratBadan}");
}
