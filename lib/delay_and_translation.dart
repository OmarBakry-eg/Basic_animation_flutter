import 'package:flutter/material.dart';
import 'extension.dart';

class DelayAndTransition extends StatefulWidget {
  @override
  _DelayAndTransitionState createState() => _DelayAndTransitionState();
}

class _DelayAndTransitionState extends State<DelayAndTransition>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation, delayedAnimation, moreDelayedAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = Tween(begin: 1.0, end: 0.0).animate(
      // if begin was -1.0 it will start from the right (Translation value in transform widget)
      CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn),
    );
    delayedAnimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    moreDelayedAnimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
      ),
      //for delaying animation use interval class in curve that it end with 1.0 value and begin from 0
      //so you can modify these value as you want to make the curve delayed
    );
    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Transform(
                    transform: Matrix4.translationValues(
                        0.0, animation.value * width, 0.0),
                    child: Center(
                      child: Container(
                        child: Text(
                          'Animated',
                          style: textStyle(FontWeight.bold, Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        delayedAnimation.value * width, 0.0, 0.0),
                    child: Center(
                      child: Container(
                        child: Text(
                          'Delayed Animation',
                          style: textStyle(FontWeight.bold, Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        moreDelayedAnimation.value * width, 0.0, 0.0),
                    child: Center(
                      child: Container(
                        child: Text(
                          'More Delayed Animation',
                          style: textStyle(FontWeight.bold, Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
