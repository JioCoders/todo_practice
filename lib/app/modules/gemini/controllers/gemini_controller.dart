import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiController extends GetxController {
  late final geminiVersionProModel;
  final count = 0.obs;
  final apiKeyOther = 'AIzaSyCNPXTgr6aDQyy2GJgunSUdaLJ7gF1rwpg';
  static const geminiApikey = 'AIzaSyAsOCiUYfsZNh54Z-g4bDlOvjoBNVb2dig';

  @override
  void onInit() {
    super.onInit();
    _setupGeminiAI();
  }

  void _setupGeminiAI() {
    geminiVersionProModel = GenerativeModel(
        model: 'gemini-1.5-pro',
        apiKey: geminiApikey,
        safetySettings: [
          SafetySetting(HarmCategory.harassment, HarmBlockThreshold.high),
          SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.high),
        ]);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
