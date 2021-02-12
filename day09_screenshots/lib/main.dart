import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path/path.dart';
import 'package:share/share.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Screenshot(
                controller: _screenshotController,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Image.asset('images/bernie.jpg'),
                        Text('Bernie Sanders')
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: takeScreenshot,
                  child: Text('Take Screenshots and share'))
            ],
          ),
        ),
      ),
    );
  }

  void takeScreenshot() async {
    final directory = (await getExternalStorageDirectory()).path;

    final pngBytes =
        await _screenshotController.capture(delay: Duration(milliseconds: 10));

    File imageFile = File('$directory/screenshot.png');

    // Share.share('Hello World!');
    // Share.share(['${directory.path}/']);

    // Share.shareFiles([imageFile]);
  }
}
