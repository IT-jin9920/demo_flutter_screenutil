import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(320, 568),
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter_ScreenUtil',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(title: 'FlutterScreenUtil Demo'),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double defaultWidth;
  late double defaultHeight;

  @override
  Widget build(BuildContext context) {
    // Get the physical size of the device screen in the build method
    defaultWidth = MediaQuery.of(context).size.width;
    defaultHeight = MediaQuery.of(context).size.height;

    print('Device width dp: ${1.sw}dp');
    print('Device height dp: ${1.sh}dp');

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 0.07.sh),
          child: AppBar(
            backgroundColor: Colors.amberAccent,
            title: Text(
              'Demo of flutter_screenutil',
              style: TextStyle(fontSize: 18.sp, color: Colors.black), // Used sp for font scaling
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.refresh,
                  color: Colors.black,
                  size: 20.sp, // Used sp for font scaling
                ),
                onPressed: () {
                  _handleRefresh();
                  print(" tap Refresh..");
                },
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            // BACKGROUND IMAGE
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.softLight),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0.015.sw, 0.0, 0.015.sw, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        width: 0.2.sw,
                        height: 0.2.sh,
                        child: AspectRatio(
                          aspectRatio: 2.0 / 0.20,
                          child: Image.network("https://randomuser.me/api/portraits/men/40.jpg"),
                        ),
                      ),
                      SizedBox(height: 0.03.sh),
                      Center(
                        child: Text(
                          "• ScreenUtil Defaults UI designSize: \n$defaultWidth x $defaultHeight",
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold), // Used sp for font scaling
                        ),
                      ),
                      SizedBox(height: 0.03.sh),
                      const Divider(
                        thickness: 5, // thickness of the line
                        indent: 20, // empty space to the leading edge of divider.
                        endIndent: 20, // empty space to the trailing edge of the divider.
                        color: Colors.black, // The color to use when painting the line.
                        height: 20, // The divider's height extent.
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _handleRefresh() async {
    // Simulate a delay before completing the refresh
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      // Perform actions to refresh the screen here
    });
  }
}
