library scrolling_text;

import 'dart:async';

import 'package:flutter/material.dart';

class ScrollingText extends StatefulWidget {
  ///[text] is a required field which is animated in vertical/ horizontal direction
  final String text;

  ///[TextStyle] class support styling of the [text] parameter
  final TextStyle? textStyle;

  /// defines scroll direction of the text.
  ///  [Axis.horizontal] is a default
  final Axis scrollAxis;

  /// speed of [text] to scroll.
  ///
  /// default speed is 60 pixels per [restTime].
  /// relative to [restTime]
  final double speed;

  ///Starting blank offset to the content i.e [text]
  ///
  final double? startOffset;

  ///ending blank offset to the content i.e [text]
  ///
  final double? endOffset;

  ///It defines speed of [text] to scroll.
  ///
  /// default [restTime] is 1000 milliseconds
  /// relative to [speed]
  final int restTime;

  /// [Curve] class defines way how text scroll inside the widget
  ///
  /// [Curves.linear] is a default [scrollCurve]
  final Curve? scrollCurve;

  /// this is called whenever a [text] mequeue finishes to scroll along with [startOffset] and [endOffset]
  ///
  /// specially call this to change the content from outside the class

  final VoidCallback onFinish;

  ///Scorlling Text provides marquee of text with callback at the end of scroll and also staring and ending offset of the text

  const ScrollingText(
      {super.key,
      required this.text,
      this.textStyle,
      this.scrollAxis = Axis.horizontal,
      this.speed = 60.0,
      this.startOffset,
      this.endOffset,
      this.restTime = 1000,
      this.scrollCurve,
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
  GlobalKey key = GlobalKey();

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      startTimer();
    });
  }

  void startTimer() {
    if (key.currentContext != null) {
      // double widgetWidth =
      //     _key.currentContext!.findRenderObject()!.paintBounds.size.width;
      // double widgetHeight =
      //     _key.currentContext!.findRenderObject()!.paintBounds.size.height;

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
            curve: widget.scrollCurve ?? Curves.linear);
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

  Widget getCenterChild(bool isStart) {
    if (widget.scrollAxis == Axis.vertical) {
      return Container(height: isStart ? widget.startOffset : widget.endOffset);
    }
    return Container(width: isStart ? widget.startOffset : widget.endOffset);
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
        key: key,
        scrollDirection: widget.scrollAxis,
        controller: scrollController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          getCenterChild(true),
          getBothEndsChild(),
          getCenterChild(false),
        ],
      ),
    );
  }
}
