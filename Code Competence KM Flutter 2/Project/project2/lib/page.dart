import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 230, 102, 102),
        leading: IconButton(
          icon: Image.asset('assets/icon.png'),
          onPressed: () {},
        ),
      ),
      endDrawer: const MyRightSidebar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Welcome(),
                const MyWidget(),
                Text(
                  'About Us',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Alterra Academy Programs',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomCard(
                      judul: 'Immersive Program',
                      icon: Icons.code,
                      text:
                          'Program pelatihan coding bootcamp intensif bagi kamu yang pemula. baik dengan latar belakang IT maupun NonIT. Untuk menjadi seorang software enginer profesional dalam waktu 9 minggu.',
                    ),
                    CustomCard(
                      judul: 'Immersive Program',
                      icon: Icons.home,
                      text:
                          'Program pelatihan coding bootcamp intensif bagi kamu yang pemula. baik dengan latar belakang IT maupun NonIT. Untuk menjadi seorang software enginer profesional dalam waktu 9 minggu.',
                    ),
                  ],
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        ],
      ),
    );
  }
}
