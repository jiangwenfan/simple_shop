import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter {
  // 屏幕适配器类用来解决升级后后缀不一致的问题
  static width(num v) {
    return v.w;
  }

  static height(num v) {
    return v.h;
  }

  static fontSize(num v){
    return v.sp;
  }

  static getScreenWidth(){
    return 1.sw;
  }

  static getScreenHeight(){
    return 1.sh;
  }
}
