# Rangkuman dari materi Installation Command Line Interface and Package Management in Flutter

1. Flutter CLI adalah alat yang digunakan untuk berinteraksi dengan Flutter SDK, perintah yang dijalankan menguunakan terminal. 

2. Perintah CLI antara lain :
-flutter doctor = untuk menampilkan informasi software yang dibutuhkan.
-flutter create <APP_NAME> = untuk membuat project aplikasi flutter baru.
-flutter run = untuk menjalankan project aplikasi di device yang tersedia.
-flutter emulators = menampilkan daftar emulator yang terinstall.
-flutter channel = menampilkan daftar flutter channel yang tersedia dan yang digunakan.
-flutter pub = flutter pub add (untuk menambahkan packages ke depencies yang ada di pubspec.yaml). flutter pub get (untuk mendownload semua packages atau dependencies yang ada di pubspec.yaml).
-flutter build = untuk memproduksi file aplikasi untuk publish ke appstore/playstore.
-flutter clean = perintah untuk menghapus folder build serta file lainya yang dihasilkan saat kita menjalankan aplikasi di emulator.

3. Packages Management
flutter mendukung sharing package dengan tujuan mempercepat pengembangan aplikasi karena tidak perlu membuat semuanya dari awal. Packagaes dibuat oleh developer lain dan bisa didapatkan di web pub.dev. 

cara menambahkan packages : 
-cari package di pub.dev
-copy baris dependencies
-buka pubspec.yaml
-paste dibawah baris dependencies di pubspec.yaml
-run flutter pub get di terminal
-import package di file dart agar bisa digunakan
-restart aplikasi jika dibutuhkan