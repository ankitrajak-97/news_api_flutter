import 'package:get/get.dart';

import '../service/data_provider_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DataProviderService());
  }
}
