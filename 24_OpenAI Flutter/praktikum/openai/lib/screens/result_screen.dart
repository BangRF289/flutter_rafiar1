import 'package:flutter/material.dart';
import '../models/open_ai.dart';

class ResultScreen extends StatefulWidget {
  final GptData gptResponseData;

  // Konstruktor untuk menerima data rekomendasi
  const ResultScreen({Key? key, required this.gptResponseData})
      : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Recommendations"),
        centerTitle: true,
        backgroundColor: Colors.purple, // Mengatur warna ungu pada AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  "Recommendation results",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (widget.gptResponseData.choices.isNotEmpty)
                  Card(
                    elevation: 4, // Mengatur elevasi Card
                    margin:
                        const EdgeInsets.all(16.0), // Mengatur jarak dari tepi
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        widget.gptResponseData.choices[0].text,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                else
                  const Text("Data kosong"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
