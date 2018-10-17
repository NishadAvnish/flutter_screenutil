import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter_ScreenUtil',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'FlutterScreenUtil Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ///Set the fit size (fill in the screen size of the device in the design) If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    print('Device width:${ScreenUtil.screenWidth}'); //Device width
    print('Device height:${ScreenUtil.screenHeight}'); //Device height
    print(
        'Device pixel density:${ScreenUtil.pixelRatio}'); //Device pixel density
    print(
        'Bottom safe zone distance:${ScreenUtil.bottomBarHeight}'); //Bottom safe zone distance，suitable for buttons with full screen
    print(
        'Status bar height:${ScreenUtil.statusBarHeight}px'); //Status bar height , Notch will be higher Unit px
    print(
        'The ratio of font and width to the size of the design:${ScreenUtil().scaleWidth}'); //The width is enlarged relative to the design draft
    print(
        'The ratio of  height width to the size of the design:${ScreenUtil().scaleHeight}'); //The height is enlarged relative to the design draft

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(375),
                  height: ScreenUtil().setHeight(200),
                  color: Colors.red,
                  child: Text(
                    'My width:${ScreenUtil().setWidth(375)}dp',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(28, false)),
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(375),
                  height: ScreenUtil().setHeight(200),
                  color: Colors.blue,
                  child: Text('My width:${ScreenUtil().setWidth(375)}dp',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(28, false))),
                ),
              ],
            ),
            Text('Device width：${ScreenUtil.screenWidth}px'),
            Text('Device height:${ScreenUtil.screenHeight}px'),
            Text('Device pixel density:${ScreenUtil.pixelRatio}'),
            Text('Bottom safe zone distance:${ScreenUtil.bottomBarHeight}px'),
            Text('Status bar height:${ScreenUtil.statusBarHeight}px'),
            Text(
              'Width is enlarged relative to the design draft:${ScreenUtil().scaleWidth}',
              textAlign: TextAlign.center,
            ),
            Text(
              'Height is enlarged relative to the design draft:${ScreenUtil().scaleHeight}',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(200),
            ),
            Text('System font scaling factor:${ScreenUtil.textScaleFactory}'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    'My font size is 28px and will not change with the system.',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(28, false))),
                Text('My font size is 28px and will change with the system.',
                    style: TextStyle(
                        color: Colors.black, fontSize: ScreenUtil().setSp(28))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
