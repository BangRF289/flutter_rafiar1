// Soal Prioritas 2
// Tugas Perulangan (Looping)

import 'dart:io';

// Soal 1 SEGITIGA
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


// Soal 2 JAM PASIR
// void main() {
//   for (var i = 0; i < 9; i++) {
//     for (var j = 0; j < i; j++) {
//       stdout.write(" ");
//     }
//     for (var k = 1; k <= 2 * (9 - i) - 1; k++) {
//       stdout.write("*");
//     }
//     stdout.writeln();
//   }
//   for (var i = 2; i < 9; i++) {
//     for (var j = 0; j < 9 - i; j++) {
//       stdout.write(" ");
//     }
//     for (var k = 1; k <= 2 * i - 1; k++) {
//       stdout.write("*");
//     }
//     stdout.writeln();
//   }
// }
