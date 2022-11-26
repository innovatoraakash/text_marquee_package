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

 This package can be used to make a scrolling text widget(marquee) same as shown on bottom of the news channel.

## Features

you can have callback function on the end of any text scrolling 

## Getting started

                                ``` Center(
                                    child: ScrollingText(
                                      onFinish: () {
                                        //function to change news
                                      },
                                      text: "sample text data",
                                      textStyle: TextStyle(
                                          fontSize: size.height * 0.05),
                                    ),
                                  )```

## Usage

    ``` Center(
                                    child: ScrollingText(
                                      onFinish: () {
                                        //function to change news
                                      },
                                      text: "sample text 2",
                                      textStyle: TextStyle(
                                          fontSize: size.height * 0.05),
                                    ),
                                  )```



