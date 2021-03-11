import 'package:coffie/services/coffee_service.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CoffieServices());
  }
}
