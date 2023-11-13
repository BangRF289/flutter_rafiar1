# Rangkuman MVVM Architecture

(1). Model-View-ViewModel (MVVM)
- MVVM adalah arsitektur perangkat lunak yang terdiri dari tiga komponen utama: Model, View, dan ViewModel. Tujuannya adalah untuk memisahkan logika bisnis dari antarmuka pengguna (UI) sehingga pengembangan dan pemeliharaan kode dapat lebih mudah dilakukan.
- Model: Mewakili struktur data dan logika bisnis. Model tidak memiliki pengetahuan tentang ViewModel atau View, dan tidak langsung berinteraksi dengan UI.
- View: Menangani tampilan atau antarmuka pengguna. Dalam konteks MVVM, View hanya menangani logika presentasi dan tidak memiliki logika bisnis. It berkomunikasi dengan ViewModel untuk mendapatkan atau menetapkan data.
- ViewModel: Berfungsi sebagai perantara antara Model dan View. Ini berisi logika bisnis, mengambil data dari Model, dan mempersiapkannya untuk ditampilkan di View. ViewModel tidak memiliki pengetahuan tentang View yang digunakan.

(2). Binding Two-Way
- Salah satu fitur utama MVVM adalah pengikatan dua arah (two-way binding), yang memungkinkan pembaruan otomatis antara Model, ViewModel, dan View. Ketika data berubah di Model atau View, perubahan tersebut secara otomatis disinkronkan melalui ViewModel.
- Model to ViewModel: Model memberikan pembaruan ke ViewModel ketika data di Model berubah.
- ViewModel to View: ViewModel memberi tahu View ketika data yang harus ditampilkan di UI telah berubah.
- View to ViewModel: Saat pengguna berinteraksi dengan UI, perubahan di View juga diteruskan ke ViewModel untuk pemrosesan lebih lanjut.

(3). Keuntungan MVVM
- Pemisahan Tugas:
MVVM memisahkan tugas dan tanggung jawab di antara Model, View, dan ViewModel. Ini mempermudah pengelolaan kode, memahami logika bisnis, dan pengujian unit.
- Kode yang Mudah Dikelola:
Dengan pemisahan yang jelas antara lapisan, kode dapat diorganisir dengan baik, dan pengembang dapat fokus pada bagian tertentu tanpa perlu memahami seluruh aplikasi.
- Pengujian yang Lebih Mudah:
Karena logika bisnis terkonsentrasi di ViewModel dan terpisah dari UI, pengujian otomatis lebih mudah dilakukan. ViewModel dapat diuji secara terpisah tanpa ketergantungan pada antarmuka pengguna.