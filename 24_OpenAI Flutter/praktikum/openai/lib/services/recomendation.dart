import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:openai/models/open_ai.dart';

import '../constants/open_ai.dart';

class RecommendationService {
  static Future<GptData> getRecommendation({
    required String camera,
    required String budget,
    required String storage,
  }) async {
    late GptData gptData = GptData(
      id: "",
      object: "",
      created: 0,
      model: "",
      choices: [],
      usage: Usage(
        promptTokens: 0,
        completionTokens: 0,
        totalTokens: 0,
      ),
    );

    try {
      var url = Uri.parse("https://api.openai.com/v1/completions");

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Charset": "utf-8",
        "Authorization": "Bearer $apiKey",
      };

      final formatCurrency = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'Rp. ',
        decimalDigits: 0,
      );

      String smartphoneBudget = formatCurrency.format(int.parse(budget));
      String promptData =
          "Anda ahli dalam seputar smartphone. Berikan saya beberapa rekomendasi smartphone terbaru berdasarkan Harga $smartphoneBudget, Kamera $camera, dan Kapasitas Penyimpanan Internal $storage.";

      final data = jsonEncode({
        "model": "text-davinci-003",
        "prompt": promptData,
        "max_tokens": 500,
        "temperature": 0.7,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0,
      });

      var response = await http.post(
        url,
        headers: headers,
        body: data,
      );

      if (response.statusCode == 200) {
        gptData = gptDataFromJson(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }

    return gptData;
  }
}
