import 'package:get/get.dart';
import '../../home/views/home_view.dart';
import '../../category/views/category_view.dart';
import '../../give/views/give_view.dart';
import '../../cart/views/cart_view.dart';
import '../../user/views/user_view.dart';
import 'package:flutter/material.dart';

class TabsController extends GetxController {
  //TODO: Implement TabsController

  RxInt currentIndex = 0.obs; //tab选择index

  // tabs对应的view页面
  final List<Widget> pages = const [
    HomeView(),
    CategoryView(),
    GiveView(),
    CartView(),
    UserView(),
  ];

  void setCurrentIndex(index) {
    // 修改当前tab索引
    currentIndex.value = index;
    update();
  }

  PageController pageController = PageController(initialPage: 0);

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
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
