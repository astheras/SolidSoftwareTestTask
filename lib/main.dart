import 'package:flutter/material.dart';
import 'package:samykov_solid_test_task/widgets/button.dart';

import 'utils/tools.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          button: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Hind',
            color: Colors.white,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.black,
          foregroundColor: Colors.red,
        ),
      ),
      home: MyHomePage(title: 'Samykov Test Task'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _mode = 0;
  Color colorBegin = Colors.white;
  Color colorEnd;

  Color colorBegin2 = Colors.white;
  Color colorEnd2;

  // This widget is the root of your application.
  AnimationController _controller;
  AnimationController _controller2;
  Animation<Color> animation;
  Animation<Color> animation2;

  // constructor
  _MyHomePageState() {
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _controller2 = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _render(),
    );
  }

  // main render function
  _render() {
    return Stack(
      overflow: Overflow.visible,
      children: [
        _background(),
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // just random color
                  Button(
                    label: "1",
                    onPressed: () {
                      _setColorMode(1);
                    },
                  ),
                  // gradient
                  Button(
                    label: "2",
                    onPressed: () {
                      _setColorMode(2);
                    },
                  ),
                  Button(
                    label: "3",
                    onPressed: () {
                      _setColorMode(3);
                    },
                  ),
                ],
              ),
              //GalaxyMapNavigatorContainer()
            ],
          ),
        )
      ],
    );
  }

  // main background
  _background() {
    return Positioned(
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              color: _mode == 0 || animation == null ? null : animation.value,
              gradient: _setBoxGradient()),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('hey there'),
                Text(_setMessage()),
                Text(
                  _mode == 0
                      ? 'please select something'
                      : 'please tap anywhere',
                ),
              ],
            ),
          ),
        ),
        onTap: _setGeneratedColor,
      ),
    );
  }

  // generate and set color
  _setGeneratedColor() {
    if (_mode == 1) {
      // random color
      _setColor();
    } else if (_mode == 2) {
      _setLinearGradient();
    } else if (_mode == 3) {
      _setSweepGradient();
    }
  }

  // set main color
  _setColor() {
    _controller.stop();
    _controller2.stop();
    colorEnd = generateRandomColor();
    animation = ColorTween(
      begin: colorBegin,
      end: colorEnd,
    ).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          colorBegin = colorEnd;
          //_controller.reset();
        }
      })
      ..addListener(() {
        setState(() {});
      });

    //_controller.forward()();
    if (colorBegin != null) _controller.reset();

    _controller.forward();
  }

  _setLinearGradient() {
    _controller.stop();
    _controller2.stop();
    colorEnd = generateRandomColor();

    animation = ColorTween(
      begin: colorBegin,
      end: colorEnd,
    ).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          colorBegin = colorEnd;
          //_controller.reset();
        }
      })
      ..addListener(() {
        setState(() {});
      });
    //second color
    colorEnd2 = generateRandomColor();

    animation2 = ColorTween(
      begin: colorBegin2,
      end: colorEnd2,
    ).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          colorBegin2 = colorEnd2;
        }
      })
      ..addListener(() {
        setState(() {});
      });

    //_controller.forward()();
    if (colorBegin != null) _controller.reset();
    if (colorBegin2 != null) _controller2.reset();

    _controller.forward();
    _controller2.forward();
  }

  _setSweepGradient() {
    _controller.stop();
    _controller2.stop();
    colorEnd = generateRandomColor();

    animation = ColorTween(
      begin: colorBegin,
      end: colorEnd,
    ).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          colorBegin = colorEnd;
          //_controller.reset();
        }
      })
      ..addListener(() {
        setState(() {});
      });
    //second color
    colorEnd2 = generateRandomColor();

    animation2 = ColorTween(
      begin: colorBegin2,
      end: colorEnd2,
    ).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          colorBegin2 = colorEnd2;
        }
      })
      ..addListener(() {
        setState(() {});
      });

    //_controller.forward()();
    if (colorBegin != null) _controller.reset();
    if (colorBegin2 != null) _controller2.reset();

    _controller.forward();
    _controller2.forward();
  }

  // set gradient value
  _setBoxGradient() {
    if (_mode == 2 && animation != null && animation2 != null) {
      return LinearGradient(
        colors: [
          animation.value,
          animation2.value,
        ],
      );
    } else if (_mode == 3 && animation != null && animation2 != null) {
      Color color1 = darken(animation.value);
      Color color3 = lighten(animation.value);
      Color color5 = lighten(animation2.value);
      //color3.value.value += 100;

      return RadialGradient(
        colors: [
          color1,
          animation.value,
          color3,
          animation2.value,
          color5,
        ],
        stops: [0.8, 0.96, 0.74, 0.22, 0.85],
      );
    } else
      return null;
  }

  // set color mode
  _setColorMode(mode) {
    setState(() {
      _mode = mode;
    });
  }

  // get color info by selected mode
  String _setMessage() {
    String message;
    String end;
    if (_mode == 0) {
      message = 'nothing';
    } else if (_mode == 1) {
      message = 'just random color';
    } else if (_mode == 2) {
      message = 'linear gradient color';
    } else if (_mode == 3) {
      message = 'radial gradient color';
    }

    end = _mode == 0 ? '' : 'mode';

    return 'you have selected $message $end';
  }
}
