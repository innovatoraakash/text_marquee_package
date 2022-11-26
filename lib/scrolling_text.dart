library scrolling_text;

import 'dart:async';

import 'package:flutter/material.dart';

class ScrollingText extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final Axis scrollAxis;
  final double ratioOfBlankToScreen;
  final double speed;
  final int restTime;
  final VoidCallback onFinish;

  const ScrollingText(
      {super.key,
      required this.text,
      this.textStyle,
      this.scrollAxis = Axis.horizontal,
      this.ratioOfBlankToScreen = 0.9,
      this.speed = 60.0,
      this.restTime = 1000,
      required this.onFinish});

  @override
  State<StatefulWidget> createState() {
    return ScrollingTextState();
  }
}

class ScrollingTextState extends State<ScrollingText>
    with SingleTickerProviderStateMixin {
  ScrollController? scrollController;
  double? screenWidth;
  double? screenHeight;
  double position = 0.0;
  Timer? timer;
  GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      startTimer();
    });
  }

  void startTimer() {
    if (_key.currentContext != null) {
      double widgetWidth =
          _key.currentContext!.findRenderObject()!.paintBounds.size.width;
      double widgetHeight =
          _key.currentContext!.findRenderObject()!.paintBounds.size.height;

      timer = Timer.periodic(Duration(milliseconds: widget.restTime), (timer) {
        double maxScrollExtent = scrollController!.position.maxScrollExtent;
        double pixels = scrollController!.position.pixels;
        if (pixels + widget.speed >= maxScrollExtent) {
          position = 0.0;
          scrollController!.jumpTo(position);
          widget.onFinish();
        }
        position += widget.speed;
        scrollController!.animateTo(position,
            duration: Duration(milliseconds: widget.restTime),
            curve: Curves.linear);
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  Widget getBothEndsChild() {
    if (widget.scrollAxis == Axis.vertical) {
      String newString = widget.text.split("").join("\n");
      return Text(
        newString,
        style: widget.textStyle,
        textAlign: TextAlign.right,
      );
    }
    return Center(
      child: Text(
        widget.text,
        style: widget.textStyle,
      ),
    );
  }

  Widget getCenterChild() {
    return Container(width: screenWidth! * widget.ratioOfBlankToScreen);
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      timer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        key: _key,
        scrollDirection: widget.scrollAxis,
        controller: scrollController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          getCenterChild(),
          getBothEndsChild(),
          getCenterChild(),
        ],
      ),
    );
  }
}
