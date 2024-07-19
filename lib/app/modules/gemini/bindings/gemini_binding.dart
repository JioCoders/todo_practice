import 'package:get/get.dart';

import '../controllers/gemini_controller.dart';

class GeminiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GeminiController>(
      () => GeminiController(),
    );
  }
}
