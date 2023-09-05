import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../models/shop.dart';
import '../../../models/focus_model_model.dart';
import '../../../models/category_model.dart';

class HomeController extends GetxController {
  // 浮动导航开关
  RxBool flag = false.obs;
  final ScrollController scrollController = ScrollController();

  //轮播图资源
  // List swiperList = [
  //   {"url": "https://www.itying.com/images/focus/focus01.png"},
  //   {"url": "https://www.itying.com/images/focus/focus02.png"},
  // ];
  // 定义为响应式数据
  // RxList swiperList = [].obs;
  RxList<FocusItemModel> swiperList = <FocusItemModel>[].obs;

  // 首页分类数据
  RxList<CategoryItemModel> categoryList = <CategoryItemModel>[].obs;

  @override
  void onInit() {
    print("执行home controller");
    super.onInit();

    // 监听滚动条事件
    scrollControllerListener();

    // 获取远程轮播图数据
    getFocusData();

    // 模型类使用演示
    // String jsonStr = '{"_id":"59f6ef443ce1fb0fb02c7a43","title":"米家智能空气炸烤箱","status":"1","pic":"public\\upload\\zon0TTXnXUs1z5meqZhP5aNF.png","url":"12","position":1}';
    // ShopModel shop = ShopModel.fromJson(json.decode(jsonStr));
    // print(shop.title);

    // 获取首页分类数据
    getCategoryData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  scrollControllerListener() {
    // 当在屏幕上上下拖动时，滑动条就会不停触发这个方法。
    scrollController.addListener(() {
      // 向下拉，当滑动的位置10<x<20 时，第一次因为flag是False触发方法进行更新状态；当第二次还处于这个区间时，由于flag是true所以不触发这个更新
      if (scrollController.position.pixels > 10) {
        if (flag.value == false) {
          print("controller > 10");
          flag.value = true;
          update();
        }
      }
      //当向上拉的时候，也只会触发一次
      if (scrollController.position.pixels < 10) {
        if (flag.value == true) {
          print("controller < 10");
          flag.value = false;
          update();
        }
      }
    });
  }

  // 获取远程轮播图资源
  getFocusData() async {
    var response = await Dio().get("https://xiaomi.itying.com/api/focus");
    print(response.data);
    print(response.data is Map); // true

    // swiperList.value = response.data["result"];

    // 使用自动生成的model类型的数据
    var focus = FocusModel.fromJson(response.data);
    swiperList.value = focus.result!; // 当不为空时进行赋值
    update();
  }

  // 获取首页分类接口
  getCategoryData() async {
    var response = await Dio().get("https://xiaomi.itying.com/api/bestCate");

    var category = CategoryModel.fromJson(response.data);
    categoryList.value = category.result!;
    update();
  }
}
