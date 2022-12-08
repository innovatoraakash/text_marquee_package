import 'package:flutter/material.dart';

import 'package:scrolling_text/scrolling_text.dart';

void main() {


}
  class TestScreen extends StatefulWidget {
    const TestScreen({super.key});
  
    @override
    State<TestScreen> createState() => _TestScreenState();
  }
  
  class _TestScreenState extends State<TestScreen> {
    @override
    Widget build(BuildContext context) {
      return  ScrollingText(text: "",onFinish: (){},);
    }
  }