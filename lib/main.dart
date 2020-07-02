import 'delay_and_translation.dart';
import 'package:flutter/material.dart';
import 'extension.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation scaleAnimation;
  Animation fadeAnimation;
  Animation rotationAnimation;
  Animation sizeAnimation;
  Animation slideAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    scaleAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.bounceInOut),
    );
    fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: animationController,
          curve: Interval(0.2, 1.0, curve: Curves.easeInOutBack)),
    );
    rotationAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.4, 1.0, curve: Curves.elasticInOut),
      ),
    );
    sizeAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.6, 1.0, curve: Curves.easeInOutCirc),
      ),
    );
    slideAnimation = Tween(begin: Offset.zero, end: Offset(0.5, 0.0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.easeInCirc),
      ),
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ScaleTransition(
                scale: scaleAnimation,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              FadeTransition(
                opacity: fadeAnimation,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.amber,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RotationTransition(
                turns: rotationAnimation,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.deepOrange,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SizeTransition(
                sizeFactor: sizeAnimation,
                axis: Axis.horizontal,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SlideTransition(
                position: slideAnimation,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.lightBlueAccent,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 40,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => DelayAndTransition(),
                            ));
                      },
                      child: text('Move On').center(),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 40,
                    child: RaisedButton(
                      onPressed: () {
                        if (animationController.isCompleted) {
                          setState(() {
                            animationController.reverse();
                          });
                        } else if (animationController.isDismissed) {
                          setState(() {
                            animationController.forward();
                          });
                        }
                      },
                      child: text('Restart animation').center(),
                    ),
                  ),
                ],
              ),
            ],
          ).center(),
        ),
      ),
    ).safe();
  }
}
