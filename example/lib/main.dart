import 'package:flutter/material.dart';
import 'package:scrolling_text/scrolling_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Scrolling Text Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Center(
            child: Container(
              width: 30,
              color: const Color.fromARGB(255, 128, 184, 230),
              padding: const EdgeInsets.all(10),
              child: ScrollingText(
                text: news[index],
                scrollAxis: Axis.vertical,
                onFinish: () {
                  if (index < news.length) {
                    index++;
                  } else {
                    index = 0;
                  }
                  setState(() {});
                },
              ),
            ),
          ),
        ));
  }
}

int index = 0;
List<String> news = [
  'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
  'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using  making it look like readable English.'
];
