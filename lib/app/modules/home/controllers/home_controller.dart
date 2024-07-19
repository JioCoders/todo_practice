import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_flutter/app/modules/home/photos_model.dart';
import 'package:todo_flutter/app/modules/home/providers/photos_provider.dart';

class HomeController extends GetxController {
  final client = Get.find<PhotosProvider>();

  @override
  void onInit() {
    super.onInit();
    debugPrint('Received-----------: onInit()');
    // _runInBackground();
    //   final result = await ComputeService.compute(fibonacci, 40);
    // print('Fibonacci result: $result');
  }

  void _runInBackground() async {
    final ReceivePort rp = ReceivePort();
    await Isolate.spawn(_backgroundTask, rp.sendPort);

    rp.listen((message) {
      debugPrint('message received: $message');
    });
  }

  _backgroundTask(SendPort sp) async {
    await Future.delayed(15.seconds);
    const result = 33;
    sp.send("result$result");
  }

  @override
  void onReady() {
    super.onReady();
    debugPrint('Received-----------: onReady()');
  }

  @override
  void onClose() {
    super.onClose();
    debugPrint('Received-----------: onClose()');
  }

  Future<List<PhotoModel>> fetchPhotos() async {
    return List.empty();
    // client.getPhotoList();
  }
}
