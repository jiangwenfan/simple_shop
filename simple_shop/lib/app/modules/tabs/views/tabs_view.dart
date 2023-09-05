import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //使用obx重新渲染
    return Obx(() => Scaffold(
          // appBar: AppBar(
          //   title: const Text('TabsView'),
          //   centerTitle: true,
          // ),
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.green,
            iconSize: 30,
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              // 当点击tab时，改变当前tab
              controller.setCurrentIndex(index);
              // 当点击tab时，使用pageView跳转
              controller.pageController.jumpToPage(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: "category"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.room_service), label: "service"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "cart"),
              BottomNavigationBarItem(icon: Icon(Icons.people), label: "user"),
            ],
          ),
          // 使用pageView支持左右滑动
          body: PageView(
            controller: controller.pageController,
            children: controller.pages,
            onPageChanged: (index) {
              // 滑动时改变tab页面
              controller.setCurrentIndex(index);
            },
          ),
        ));
  }
}
