import 'package:get/get.dart';

class CategoryController extends GetxController {
  //TODO: Implement CategoryController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print("----执行----category ....");
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
