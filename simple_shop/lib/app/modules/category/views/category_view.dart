import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/category_controller.dart';
import '../../../services/screenAdapter.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);

  Widget LanguageWidget() {
    print(controller.count);
    return Column(
      children: [
        ElevatedButton(onPressed: (){
          Get.toNamed("/article");
        }, child: Text("article")),
        ElevatedButton(
            onPressed: () {
              Get.toNamed("/sentence");
            },
            child: Text("sentence"))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CategoryView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // Container(
            //   width: ScreenAdapter.width(1080),
            //   height: ScreenAdapter.height(600),
            //   color: Colors.yellow,
            //   child: Text(
            //     "手机",
            //     style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
            //   ),
            // )
            LanguageWidget(),
          ],
        ));
  }
}
