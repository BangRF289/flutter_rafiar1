// Hasil dari Soal Eksplorasi no 1
dataDuplikat(List<String> data) {
  List<String> dataDuplikat = data.toSet().toList();

  return dataDuplikat;
}

void main() {
  List<String> listData = [
    'amuse',
    'Tommy Kiarra',
    'spoon',
    'HKS',
    'litchfield',
    'amuse',
    'HKS'
  ];

  var hasil = dataDuplikat(listData);
  print("Data Sebelumnya     : $listData");
  print("Data tanpa duplikat : $hasil");
}
