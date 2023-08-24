// Soal Prioritas 2
// Tugas Perulangan (Looping)
import 'dart:io';

void main() {
  for (var i = 0; i < 9; i++) {
    for (var j = 0; j < 9 - i; j++) {
      stdout.write(" ");
    }
    for (var k = 1; k <= 2 * i - 1; k++) {
      stdout.write("*");
    }
    stdout.writeln();
  }
}
