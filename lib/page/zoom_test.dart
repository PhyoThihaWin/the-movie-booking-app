import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';


class ZoomTestPage extends StatelessWidget {
  const ZoomTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PinchZoom(
              resetDuration: const Duration(milliseconds: 100),
              maxScale: 2.5,
              onZoomStart: (){print('Start zooming');},
              onZoomEnd: (){print('Stop zooming');},
              child: Image.network('https://placekitten.com/640/360'),
            ),
          ),
          Container(
            height: 200,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
