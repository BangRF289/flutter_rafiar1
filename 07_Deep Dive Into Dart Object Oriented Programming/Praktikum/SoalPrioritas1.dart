//Soal Eksplorasi 1 No 1 & 2
class BangunRuang {
  int panjang;
  int lebar;
  int tiggi;

  BangunRuang(this.panjang, this.lebar, this.tiggi);

  int volume() {
    int hasil = panjang * lebar * tiggi;
    return hasil;
  }
}

class Kubus extends BangunRuang {
  Kubus(int panjang) : super(panjang, 0, 0);

  @override
  int volume() {
    int kubus = panjang * panjang * panjang;
    print("Hasil dari Volume Kubus dengan sisi $panjang adalah $kubus");
    return kubus;
  }
}

class Balok extends BangunRuang {
  Balok(int panjang, int lebar, int tinggi) : super(panjang, lebar, tinggi);

  @override
  int volume() {
    int hasil = panjang * lebar * tiggi;
    print(
        "Hasil dari Volume Balok dengan Panjang $panjang, Lebar $lebar, Tinggi $tiggi adalah $hasil");
    return hasil;
  }
}

void main() {
  var balok = Balok(6, 4, 2);
  balok.volume();

  var kubus = Kubus(3);
  kubus.volume();
}
