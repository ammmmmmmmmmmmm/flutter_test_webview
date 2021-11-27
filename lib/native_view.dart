/*
 * @Author: 杨雪剑
 * @Date: 2021-10-26 16:48:04
 * @LastEditTime: 2021-11-27 15:50:23
 * @LastEditors: 杨雪剑
 * @Description: 
 */
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NativeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NativeViewState();
}

class _NativeViewState extends State<NativeView> {
  @override
  Widget build(BuildContext context) {
    final fac = Factory<OneSequenceGestureRecognizer>(
      () => new TapGestureRecognizer(),
    );
    final fac2 = Factory<OneSequenceGestureRecognizer>(
      () => new VerticalDragGestureRecognizer(),
    );
    // TODO: implement build
    return UiKitView(
        viewType: "plugins/native_view",
        gestureRecognizers: [fac].toSet(),
        hitTestBehavior: PlatformViewHitTestBehavior.translucent);
  }
}
