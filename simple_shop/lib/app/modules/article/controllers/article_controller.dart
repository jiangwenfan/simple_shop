import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ArticleController extends GetxController {
  RxInt count = 0.obs;
  
  RxList articles_result = [].obs;
  @override
  void onInit() {
    super.onInit();
    print("--执行-- article");
    // 获取所有article
    fetchAllArticles();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchAllArticles () async {
    print("获取article数据");
    var response = await Dio().get("http://172.20.10.5:8001/articles/");
    // print(response.data);
    print(response.data is Map);

    articles_result.value = response.data["results"];
    update();
  }
}
