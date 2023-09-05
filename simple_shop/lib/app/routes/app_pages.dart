import 'package:get/get.dart';

import '../modules/article/bindings/article_binding.dart';
import '../modules/article/views/article_view.dart';
import '../modules/article/views/add_article_view.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/category/views/category_view.dart';
import '../modules/give/views/give_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/sentence/bindings/sentence_binding.dart';
import '../modules/sentence/views/sentence_view.dart';
import '../modules/tabs/bindings/tabs_binding.dart';
import '../modules/tabs/views/tabs_view.dart';
import '../modules/user/views/user_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TABS;

  static final routes = [
    // GetPage(
    //   name: _Paths.HOME,
    //   page: () => const HomeView(),
    //   binding: HomeBinding(),
    // ),
    GetPage(
      name: _Paths.TABS,
      page: () => const TabsView(),
      binding: TabsBinding(),
    ),
    // GetPage(
    //   name: _Paths.CATEGORY,
    //   page: () => const CategoryView(),
    //   binding: CategoryBinding(),
    // ),
    // GetPage(
    //   name: _Paths.GIVE,
    //   page: () => const GiveView(),
    //   binding: GiveBinding(),
    // ),
    // GetPage(
    //   name: _Paths.CART,
    //   page: () => const CartView(),
    //   binding: CartBinding(),
    // ),
    // GetPage(
    //   name: _Paths.USER,
    //   page: () => const UserView(),
    //   binding: UserBinding(),
    // ),
    GetPage(
      name: _Paths.SENTENCE,
      page: () => const SentenceView(),
      binding: SentenceBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE,
      page: () => const ArticleView(),
      binding: ArticleBinding(),
    ),
    GetPage(
      name: "/add_article",
      page: () => AddArticleView(),
    )
  ];
}
