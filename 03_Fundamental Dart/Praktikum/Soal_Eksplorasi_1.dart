import 'dart:io';

bool kata_Palindrome(String word) {
  word = word.replaceAll(' ', ''); // Menghapus spasi dari kata
  String reversedWord = word.split('').reversed.join('');
  return word == reversedWord;
}

void main() {
  print("Masukkan sebuah kata: ");
  String input = stdin.readLineSync()!;

  if (kata_Palindrome(input)) {
    print("palindrom");
  } else {
    print("bukan palindrom");
  }
}
