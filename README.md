<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
## scrolling_text

 This package can be used to make a scrolling text widget(marquee) same as shown on bottom of the news channel.

## Features
custom text style
start and ending offset for text
you can have callback function on the end of any text scrolling 
controlled speed with speed and rest parameters
vertical or horizontal scroll direction



## Usage
Add this Project to Pubspec and import as

import 'package:scrolling_text/scrolling_text.dart';

You can use as this to play multiple text in marquee

```dart
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

```
## Basic Results

Horizontal Example:

![](https://github.com/innovatoraakash/text_marquee_package/blob/master/assets/horizontal.mp4)

Vertical Example

![](https://github.com/innovatoraakash/text_marquee_package/blob/master/assets/vertical.mp4)


