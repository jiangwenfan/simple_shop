import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import '';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  // 配置状态栏透明,和下面的导航栏融入为一体了
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  // 使用ScreenUtilInit适配屏幕尺寸
  runApp(ScreenUtilInit(
    // 设计稿尺寸宽度和高度，单位px
    designSize: const Size(1080, 2400),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return GetMaterialApp(
        // 不显示debug状态图标
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    },
  ));
}
