import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/article_controller.dart';

class ArticleView extends GetView<ArticleController> {
  const ArticleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(controller.count);
    return Scaffold(
        appBar: AppBar(
          title: const Text('ArticleView'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  print("点击了");
                  Get.toNamed("/add_article");
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Obx(() => ListView.builder(
            itemCount: controller.articles_result.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.articles_result[index]["name"]),
                subtitle:
                    Text("${controller.articles_result[index]["category"]}"),
                onTap: () {
                  print("点击了 ${controller.articles_result[index]["id"]}");
                },
                trailing: ElevatedButton(onPressed: (){}, child: Text("修改")),
              );
            })));
  }
}
