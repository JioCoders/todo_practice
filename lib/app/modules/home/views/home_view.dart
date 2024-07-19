import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:todo_flutter/app/modules/home/photos_model.dart';
import 'package:todo_flutter/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
            onTap: () => Get.toNamed(Routes.GEMINI),
            child: const Text('HomeView')),
        centerTitle: true,
      ),
      body: FutureBuilder<List<PhotoModel>>(
        future: controller.fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('An error has occurred!'));
          } else if (snapshot.hasData) {
            var photoList = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: photoList.length,
              itemBuilder: (context, index) {
                final photo = photoList[index];
                return InkWell(
                  onTap: () {
                    debugPrint(
                        "ID= ${photo.id}, Title= ${photo.title}, albumId= ${photo.albumId}");
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.network(
                      'https://fastly.picsum.photos/id/692/536/354.jpg?hmac=4w0YPVEvjv89GtFP3sO7VPUDcXJqpzMdcgtpKv1xMYo',
                      scale: 1,
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
