// Soal Eksplorasi
abstract class Shape {
  int getArea() {
    return 0;
  }

  int getPerimeter() {
    return 0;
  }
}

class Circle implements Shape {
  int radius;
  Circle(this.radius);

  @override
  int getArea() {
    int luas = (3.14 * radius * radius).toInt();
    print("Hasil Luas Lingkaran dengan Jari-Jari $radius adalah $luas");
    return luas;
  }

  @override
  int getPerimeter() {
    int keliling = (2 * 3.14 * radius).toInt();
    print("Hasil Keliling Lingkaran dengan Jari-Jari $radius adalah $keliling");
    return keliling;
  }
}

class Squere implements Shape {
  int side;
  Squere(this.side);

  @override
  int getArea() {
    int luas = side * side;
    print("Hasil luas dari persegi dengan sisi $side adalah $luas");
    return luas;
  }

  @override
  int getPerimeter() {
    int keliling = 4 * side;
    print("Hasil keliling dari persegi dengan sisi $side adalah $keliling");
    return keliling;
  }
}

class Rectangle implements Shape {
  int width;
  int height;

  Rectangle(this.width, this.height);

  @override
  int getArea() {
    int luas = height * width;
    print(
        "Hasil luas dari persegi panjang dengan lebar $width dan panjang $height adalah $luas");
    return luas;
  }

  @override
  int getPerimeter() {
    int keliling = 2 * (height + width);
    print(
        "Hasil luas dari persegi panjang dengan lebar $width dan panjang $height adalah $keliling");
    return keliling;
  }
}

void main() {
  print("**************************************************************");
  var l1 = Circle(4);
  print("Jari-Jari Lingkaran adalah ${l1.radius}");
  l1.getArea();
  l1.getPerimeter();

  print("**************************************************************");
  var k1 = Squere(6);
  print("Sisi persegi adalah ${k1.side}");
  k1.getArea();
  k1.getPerimeter();

  print("**************************************************************");
  var p1 = Rectangle(4, 8);
  print("Persegi panjang dengan lebar ${p1.width} dan panjang ${p1.height}");
  p1.getArea();
  p1.getPerimeter();

  print("**************************************************************");
}
