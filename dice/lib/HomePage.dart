import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int l = 1;
  int r = 1;
  CurvedAnimation animation;
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  animate() {
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    animation.addListener(() {
      setState(() {});
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          l = Random().nextInt(6) + 1;
          r = Random().nextInt(6) + 1;
        });
        _controller.reverse();
      }
    });
  }

  void roll() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DICE'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onDoubleTap: roll,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Image(
                          height: 200 - (animation.value) * 200,
                          image: AssetImage('images/dice-$l.png'),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onDoubleTap: roll,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Image(
                          height: 200 - (animation.value) * 200,
                          image: AssetImage('images/dice-$r.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                onPressed: roll,
                child: Text(
                  'Click Here',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ));
  }
}
