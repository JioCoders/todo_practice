import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:todo_flutter/app/routes/app_pages.dart';
import 'package:todo_flutter/app/widget/network_error_item.dart';

class NetworkStatusService extends GetxService {
  NetworkStatusService() {
    Connectivity().onConnectivityChanged.listen(
      (status) async {
        _getNetworkStatus(status);
      },
    );
  }

  void _getNetworkStatus(status) {
    if (status == ConnectivityResult.mobile ||
        status == ConnectivityResult.wifi) {
      if (Get.isDialogOpen == true) {
        Get.offNamedUntil(Routes.HOME, (_) => false);
      }
    } else {
      Get.dialog(const NetworkErrorItem(), useSafeArea: false);
    }
  }
}
