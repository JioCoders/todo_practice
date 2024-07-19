import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:todo_flutter/app/modules/other/physics/draggable_card.dart';
import 'package:todo_flutter/app/modules/other/physics/physics.dart';

class BackupView extends GetView<HomeController> {
  const BackupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        debugPrint(
            '------constaingt=>${constraints.maxWidth}, ${constraints.maxHeight}');
        return constraints.maxWidth < 400
            ? const DraggableCard(
                child: FlutterLogo(
                    size: 128)) //singleColumnLayout : twoColumnLayout
            : Container(
                color: Colors.amber,
                child: Center(
                  child: InkWell(
                    // onTap: () => Get.to(() => const Game1View()),
                    // onTap: () => Get.to(() => const Game2View()),
                    // onTap: () => Get.to(() => const GravityView()),
                    // onTap: () => Get.to(() => const SpringView()),
                    onTap: () => Get.to(() => const TweenView(hero: true)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: 'heroTag',
                          child: Icon(Icons.add, size: 70.0),
                        ),
                        Text(
                          'HomeView is working',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
