import 'package:animated_onboarding/model/onboard_page_item.dart';
import 'package:animated_onboarding/screens/onboard/onboard_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Onboard extends StatefulWidget {
  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> with SingleTickerProviderStateMixin {
  List<OnboardPageItem> onboardPageItems = [
    OnboardPageItem(
      image: 'assets/images/canlender.png',
      text: 'The Prefect\nproduct for your\nskin type.',
      text1: 'Find product that work\nfor your skin.',
      icon: 'assets/icons/calender.png',
    ),
    OnboardPageItem(
      image: 'assets/images/clock.png',
      text: 'Daily routine\nand skincare\ngudies.',
      text1: 'Notification and reminders\njust for you.',
      icon: 'assets/icons/clock.png',
    ),
    OnboardPageItem(
      image: 'assets/images/heart.png',
      text: 'Connect with\nother skincare\nlovers.',
      text1: 'Engage with others in\nthe community.',
      icon: 'assets/icons/heart.png',
    ),
  ];

  PageController? _pageController;

  List<Widget> onboardItems = [];
  double? _activeIndex;
  int? _current;
  bool _reverse = false;
  bool onboardPage = false;
  AnimationController? _animationController;

  @override
  void initState() {
    initializePages(); //initialize pages to be shown
    _pageController = PageController();
    _pageController!.addListener(() {
      print(_activeIndex);
      _activeIndex = _pageController!.page;
      print("Active Index: $_activeIndex");
      if (_activeIndex! >= 0.5 && onboardPage == false) {
        setState(() {
          onboardPage = true;
        });
      } else if (_activeIndex! < 0.5) {
        setState(() {
          onboardPage = false;
        });
      }
    });
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))..forward();
    super.initState();
  }

  initializePages() {
    /*onboardItems.add(WelcomePage()); // welcome page*/
    onboardPageItems.forEach((onboardPageItem) {
      //adding onboard pages
      onboardItems.add(OnboardPage(
        onboardPageItem: onboardPageItem,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
                height: height * 0.9,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            items: onboardItems),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(mainAxisSize: MainAxisSize.min, children: [
              ...onboardItems.map(
                (image) {
                  int index = onboardItems.indexOf(image);
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: _current == index ? Colors.grey[800] : Color.fromRGBO(0, 0, 0, 0.4)),
                  );
                },
              ),
            ]),
            SizedBox(height: 3),
            Text(
              "Skip",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    ));
  }
}
