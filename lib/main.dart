import 'package:flutter/material.dart';
import 'package:samykov_solid_test_task/widgets/button.dart';
import 'package:samykov_solid_test_task/widgets/utils/tools.dart';

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _mode = 0;
  BoxDecoration _decoration;
  Color colorBegin;
  Color colorEnd;

  // This widget is the root of your application.
  AnimationController _controller;
  Animation<Color> animation;

  // constructor
  _MyHomePageState() {
    _controller = AnimationController(
      duration: Duration(seconds: 3),
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
                mainAxisAlignment: MainAxisAlignment.center,
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
          decoration: _decoration,
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

  _setGeneratedColor() {
    _decoration = BoxDecoration(color: animation.value);

    if (_mode == 1) {
      // random color
      _setColor();
    } else if (_mode == 2) {
      //int count = randomRange(2, 5)
    }
  }

  // set main color
  _setColor() {
    //return _mode == 1 ? generateRandomColor() : null;
    colorEnd = generateRandomColor();
    animation = ColorTween(
      begin: colorBegin,
      end: colorEnd,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  // set gradient value
  _setGradient() {
/*LinearGradient(
        colors: [
          Theme.of(context).floatingActionButtonTheme.backgroundColor,
          Theme.of(context).floatingActionButtonTheme.foregroundColor
        ],
      ),
    );**/
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
    if (_mode == 0) message = 'nothing';
    if (_mode == 1)
      message = 'just random color';
    else if (_mode == 2) message = 'gradient color';

    end = _mode == 0 ? '' : 'mode';

    return 'you have selected $message $end';
  }
}
