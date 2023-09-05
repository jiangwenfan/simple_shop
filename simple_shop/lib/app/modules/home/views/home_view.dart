import 'package:flutter/material.dart';
import 'package:simple_shop/app/services/screenAdapter.dart';
import '../../../services/keepAliveWrapper.dart';
import '../../../services/shopFont.dart';
import 'package:get/get.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import '../controllers/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  //抽离组件
  Widget _appBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      //通过obx动态更新重构数据
      child: Obx(() => AppBar(
            // 是logo
            leading: Icon(
              ShopIcons.xiaomi,
              color: controller.flag.value ? Colors.black : Colors.white,
            ),
            //默认logo宽度是140，随着滑动到下方时，是20了
            leadingWidth: controller.flag.value
                ? ScreenAdapter.width(20)
                : ScreenAdapter.width(140),
            // title: const Text(
            //   'HomeView',
            //   style: TextStyle(color: Colors.black),
            // ),

            // title: Container(
            // 当下拉的的时候，搜索框在慢慢变大
            title: AnimatedContainer(
              // 300毫秒执行动画
              duration: Duration(milliseconds: 300),
              // width: ScreenAdapter.width(620),
              // 宽度随着动画慢慢变大
              width: controller.flag.value
                  ? ScreenAdapter.width(800)
                  : ScreenAdapter.width(620),
              height: ScreenAdapter.width(96),
              // 设置一个圆角
              decoration: BoxDecoration(
                  //  透明度+颜色
                  color: const Color.fromARGB(230, 252, 243, 236),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        ScreenAdapter.width(34), 0, ScreenAdapter.width(10), 0),
                    child: Icon(Icons.search),
                  ),
                  Text(
                    "手机",
                    style: TextStyle(
                        fontSize: ScreenAdapter.fontSize(32),
                        color: Colors.black),
                  )
                ],
              ),
            ),
            centerTitle: true,
            //配置顶部导航栏透明，但是有淡灰色阴影
            // backgroundColor: Colors.transparent,
            // 状态是true(滑动到下面了)的时候是白色
            backgroundColor:
                controller.flag.value ? Colors.white : Colors.transparent,
            // 去掉阴影
            elevation: 0,
            // 配置导航汗按钮
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.qr_code,
                    color: controller.flag.value ? Colors.black : Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.message,
                      color:
                          controller.flag.value ? Colors.black : Colors.white))
            ],
          )),
    );
  }

  // 轮播图
  Widget _focus() {
    return //轮播图插件必须放在容器中
        Container(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(682),
      child: Obx(() => Swiper(
            // 只有2个url,所以设置为2
            // 设置为获取的结果个数
            itemCount: controller.swiperList.length,
            itemBuilder: (context, index) {
              String picUrl =
                  "https://xiaomi.itying.com/${controller.swiperList[index].pic}";
              return Image.network(
                  // controller.swiperList[index]["url"],
                  // 将\替换为/
                  picUrl.replaceAll("\\", "/"),
                  fit: BoxFit.cover);
            },
            pagination: const SwiperPagination(
                // 下标指示样式,为长条shape
                builder: SwiperPagination.rect),
            // 这个是轮播图上的左右箭头
            // control: const SwiperControl(),
            // 自动播放
            autoplay: true,
            //循环播放
            loop: true,
            //每隔1秒
            duration: 1000,
          )),
    );
  }

  // banner
  Widget _banner() {
    return
        // 底部banner功能
        SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(92),
      child: Image.asset(
        "assets/images/xiaomiBanner.png",
        fit: BoxFit.cover,
      ),
    );
  }

  // 首页分类,静态的
  Widget _category1() {
    return // 分类
        Container(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(470),
      // color: Colors.red,
      child: Swiper(
        itemCount: 2,
        itemBuilder: (context, index) {
          return GridView.builder(
              // 生成10个元素
              itemCount: 10,
              // 一行显示5个
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                // 每个左右之间的距离
                crossAxisSpacing: ScreenAdapter.width(20),
                // 上下之间的距离
                mainAxisSpacing: ScreenAdapter.height(20),
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      // 为了显示一个正方形，宽和高都是.height
                      width: ScreenAdapter.height(136),
                      height: ScreenAdapter.height(136),

                      child: Image.network(
                          "https://xiaomi.itying.com/public/upload/mAUPB472d5kAPc2CPxANLaMj.jpg"),
                      alignment: Alignment.center,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.fromLTRB(0, ScreenAdapter.height(4), 0, 0),
                      child: Text(
                        "手机",
                        style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                      ),
                    ),
                  ],
                );
              });
        },
        // 自定义轮播图的指示器
        pagination: SwiperPagination(
            margin: const EdgeInsets.all(0.0),
            builder: SwiperCustomPagination(
                builder: (BuildContext context, SwiperPluginConfig config) {
              return ConstrainedBox(
                // 指示器举例上面内容区域的高度
                // constraints: const BoxConstraints.expand(height: ScreenAdapter.height(20.0)),
                constraints: const BoxConstraints.expand(height: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        // 矩形指示器
                        child: const RectSwiperPaginationBuilder(
                          color: Colors.black12,
                          // 选中的颜色
                          activeColor: Colors.black54,
                        ).build(context, config),
                      ),
                    )
                  ],
                ),
              );
            })),
      ),
    );
  }

  // 首页分类，动态的
  Widget _category2() {
    return // 分类
        SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(470),
      // color: Colors.red,
      child: Obx(() => Swiper(
            // 2屏幕数据。 有20条数据，每个屏幕显示10条，所以有2个屏幕
            // itemCount: controller.categoryList.length～/10,
            //  当刚开始是0条数据时，不会执行这个builder。当获取完20条数据之后，生成2个屏幕了
            itemCount: (controller.categoryList.length / 10).toInt(),

            itemBuilder: (context, index) {
              // 这个index是每个轮播图的索引,0,1
              return GridView.builder(
                  // 生成10个元素
                  itemCount: 10,
                  // 一行显示5个
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    // 每个左右之间的距离
                    crossAxisSpacing: ScreenAdapter.width(20),
                    // 上下之间的距离
                    mainAxisSpacing: ScreenAdapter.height(20),
                  ),
                  // 这个i是每个item块的索引,0-9,因为每个页面是10个数据。
                  // 算法: index*10+i
                  // index是0的时候，加载0-9；index是1的时候加载10-19
                  itemBuilder: (context, i) {
                    String picUrl =
                        "https://xiaomi.itying.com/${controller.categoryList[index * 10 + i].pic}";
                    return Column(
                      children: [
                        Container(
                          // 为了显示一个正方形，宽和高都是.height
                          width: ScreenAdapter.height(136),
                          height: ScreenAdapter.height(136),

                          child: Image.network(
                            picUrl.replaceAll("\\", "/"),
                          ),
                          alignment: Alignment.center,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, ScreenAdapter.height(4), 0, 0),
                          child: Text(
                            "${controller.categoryList[index * 10 + i].title}",
                            style:
                                TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                          ),
                        ),
                      ],
                    );
                  });
            },

            // 自定义轮播图的指示器
            pagination: SwiperPagination(
                margin: const EdgeInsets.all(0.0),
                builder: SwiperCustomPagination(
                    builder: (BuildContext context, SwiperPluginConfig config) {
                  return ConstrainedBox(
                    // 指示器举例上面内容区域的高度
                    // constraints: const BoxConstraints.expand(height: ScreenAdapter.height(20.0)),
                    constraints: const BoxConstraints.expand(height: 20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            // 矩形指示器
                            child: const RectSwiperPaginationBuilder(
                              color: Colors.black12,
                              // 选中的颜色
                              activeColor: Colors.black54,
                            ).build(context, config),
                          ),
                        )
                      ],
                    ),
                  );
                })),
          )),
    );
  }

  Widget _homePage() {
    //最外层加个position,实现轮播图在在状态栏下面
    return Positioned(
        //这个表示要超过状态栏向上多少距离
        top: -ScreenAdapter.height(160),
        left: 0,
        right: 0,
        bottom: 0,
        child: ListView(
          controller: controller.scrollController,
          children: [
            _focus(),
            _banner(),
            // _category1(),
            _category2(),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    // 使用keepalivewrapper包裹，将listview的锚点进行缓存
    return KeepAliveWrapper(
      child: Scaffold(
          body: Stack(
        children: [
          _homePage(),
          _appBar(),
        ],
      )),
    );
  }
}
