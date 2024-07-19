import 'package:get/get.dart';
import 'package:todo_flutter/app/modules/home/providers/photos_provider.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    
    Get.lazyPut<PhotosProvider>(() => PhotosProvider());
  }
}
