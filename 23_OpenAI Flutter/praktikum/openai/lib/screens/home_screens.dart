import 'package:flutter/material.dart';
import '../screens/result_screen.dart';
import '../services/recomendation.dart';

int _selectedIndex = 0;

class RecomendationScreen extends StatefulWidget {
  const RecomendationScreen({Key? key}) : super(key: key);

  @override
  State<RecomendationScreen> createState() => _RecomendationScreenState();
}

class _RecomendationScreenState extends State<RecomendationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _storageController = TextEditingController();
  final TextEditingController _cameraController = TextEditingController();
  bool isLoading = false;

  void _getRecommendations() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await RecommendationService.getRecommendation(
        budget: _budgetController.text,
        storage: _storageController.text,
        camera: _cameraController.text,
      );

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            gptResponseData: result,
          ),
        ),
      );
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('GET RECOMENDATIONS'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Phone Recommendations"),
        centerTitle: true,
        backgroundColor: Colors.purple, // Mengatur warna ungu pada AppBar
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _budgetController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Budget", // Menggunakan labelText
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF9C27B0),
                          ),
                          hintText: "Enter your Budget in IDR",
                          filled: true,
                          fillColor: Colors.grey[200],
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.purple,
                                width:
                                    2.0), // Mengatur garis bawah menjadi ungu
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your Budget in IDR';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _cameraController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Camera (MP)", // Menggunakan labelText
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF9C27B0),
                          ),
                          hintText: "Enter your Requirement for the Camera",
                          filled: true,
                          fillColor: Colors.grey[200],
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.purple,
                                width:
                                    2.0), // Mengatur garis bawah menjadi ungu
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your Requirement for the Camera';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _storageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText:
                              "Internal Storage", // Menggunakan labelText
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF9C27B0),
                          ),
                          hintText: "Enter your Desired Internal Storage",
                          filled: true,
                          fillColor: Colors.grey[200],
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.purple,
                                width:
                                    2.0), // Mengatur garis bawah menjadi ungu
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your Desired Internal Storage';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _getRecommendations();
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(const Color(
                                0xFF9C27B0)), // Mengatur warna ungu pada tombol
                            minimumSize: MaterialStateProperty.all(
                              const Size(double.infinity,
                                  50.0), // Mengatur ukuran tombol
                            ),
                          ),
                          child: const Text(
                            "GET RECOMENDATIONS",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
