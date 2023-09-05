import 'package:flutter/material.dart';

// 是一个公共库，用来缓存，listView的滑动位置，相当于锚点。
// 只能在PageView或者tabbarView中使用
class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper(
      {Key? key, @required this.child, this.keepAlive = true})
      : super(key: key);

  final Widget? child;
  final bool keepAlive;

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;

  @override
  void didUpdateWidget(covariant KeepAliveWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      // keepAlive 状态需要更新，实现在 AutomaticKeepAliveClientMixin 中
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }
}
