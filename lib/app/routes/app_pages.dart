import 'package:get/get.dart';

import '../modules/gemini/bindings/gemini_binding.dart';
import '../modules/gemini/views/geminichat_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.GEMINI,
      page: () => const GeminiChatView(title: 'AI Chat'),
      binding: GeminiBinding(),
    ),
  ];
}
