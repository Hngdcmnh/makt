import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import 'custom_introduce_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {},
                    child:
                    DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: const [
                            Icon(Icons.flag),
                            Text('Tiếng Việt'),
                            Icon(Icons.keyboard_arrow_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: CustomIntroductionScreen(
                  autoScroll: true,
                  autoScrollDuration: const Duration(seconds: 3),
                  animationDuration: 100,
                  onChange: (e) {},
                  globalBackgroundColor: Colors.white,
                  pages: [
                    PageViewModel(
                      title: "Fractional shares",
                      bodyWidget: Lottie.asset('assets/14595-thumbs-up.json'),
                      decoration: pageDecoration,
                    ),
                    PageViewModel(
                      title: "Learn as you go",
                      bodyWidget: Lottie.asset('assets/14595-thumbs-up.json'),
                      decoration: pageDecoration,
                    ),
                    PageViewModel(
                      title: "Kids and teens",
                      bodyWidget: Lottie.asset('assets/14595-thumbs-up.json'),
                      decoration: pageDecoration,
                    ),
                  ],
                  showSkipButton: false,
                  skipOrBackFlex: 0,
                  nextFlex: 0,
                  showBackButton: false,
                  showDoneButton: false,
                  showNextButton: false,
                  curve: Curves.fastLinearToSlowEaseIn,
                  controlsMargin: const EdgeInsets.all(16),
                  dotsDecorator: const DotsDecorator(
                    size: Size(10.0, 10.0),
                    color: Color(0xFFBDBDBD),
                    activeSize: Size(24.0, 10.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                  ),
                  dotsContainerDecorator: const ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text('Đăng nhập')),
              TextButton(onPressed: () {}, child: Text('Xem dữ liệu demo'))
            ],
          ),
        ),
      ),
    );
  }
}
