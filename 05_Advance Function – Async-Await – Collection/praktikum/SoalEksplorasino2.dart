// Hasil dari Soal Eksplorasi no 2
Map<String, int> hitungFrekuensi(List<String> list) {
  Map<String, int> frekuensiMap = {};

  for (String n in list) {
    if (frekuensiMap.containsKey(n)) {
      frekuensiMap[n] = (frekuensiMap[n] ?? 0) + 1;
    } else {
      frekuensiMap[n] = 1;
    }
  }

  return frekuensiMap;
}

void main() {
  List<String> listData = [
    'js',
    'js',
    'js',
    'golang',
    'python',
    'js',
    'js',
    'golang',
    'rust'
  ];

  Map<String, int> hasilFrekuensi = hitungFrekuensi(listData);

  print("Data: $listData");
  hasilFrekuensi.forEach((key, value) {
    print("$key: $value");
  });
}
