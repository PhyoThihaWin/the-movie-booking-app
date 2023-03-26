import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';

class ZoomTestPage extends StatelessWidget {
  const ZoomTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Zoom(
              initTotalZoomOut: true,
              opacityScrollBars: 0,
              child: Center(
                child: FlutterLogo(
                  size: 1000,
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.red,
          ))
        ],
      ),
    );
  }
}
