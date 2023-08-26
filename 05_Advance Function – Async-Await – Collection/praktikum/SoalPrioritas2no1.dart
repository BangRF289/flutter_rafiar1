// Hasil dari soal Prioritas 2 no 1
void main() {
  List<List<dynamic>> dataList = [
    ['murid1', 25],
    ['murid2', 30],
    ['murid3', 28],
  ];

  Map<String, int> mapData = Map.fromIterable(dataList,
      key: (item) => item[0], value: (item) => item[1]);

  print(mapData);
}
