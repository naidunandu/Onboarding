import 'package:animated_onboarding/components/showUp.dart';
import 'package:animated_onboarding/model/onboard_page_item.dart';
import 'package:flutter/material.dart';

class OnboardPage extends StatefulWidget {
  final OnboardPageItem? onboardPageItem;

  OnboardPage({this.onboardPageItem});

  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<OnboardPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  int delayAmount = 200;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height,width: width,
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2.2,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  widget.onboardPageItem!.image!,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    ShowUp(
                      child: Text(
                        widget.onboardPageItem!.text!,
                        style: TextStyle(
                          fontSize: width * 0.09,
                          fontFamily: 'ProductSans',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.08,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      delay: delayAmount + 200,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ShowUp(
                      child: Text(
                        widget.onboardPageItem!.text1!,
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontFamily: 'ProductSans',
                          letterSpacing: 0.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      delay: delayAmount + 400,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: ShowUp(
                child: Image.asset(
                  widget.onboardPageItem!.icon!,
                  width: 30,
                ),
                delay: delayAmount,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
