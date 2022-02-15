import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final String url;
  final String viewLog;
  final callBack;

  const WebViewContainer(
      {Key? key, required this.url, required this.viewLog, this.callBack})
      : super(key: key);

  @override
  _WebViewContainerState createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: "${widget.url}?origin=https://test.hoclieu.vn",
      javascriptMode: JavascriptMode.unrestricted,
      javascriptChannels: {
        JavascriptChannel(
            name: 'parent',
            onMessageReceived: (JavascriptMessage message) {
              print(message.message);
            })
      },
    );
    // return WebView(
    //   initialUrl: '${widget.url}',
    //   javascriptMode: JavascriptMode.unrestricted,
    //   javascriptChannels: {
    //     JavascriptChannel(
    //         name: 'parent',
    //         onMessageReceived: (JavascriptMessage message) {
    //           print(message.message);
    //           widget.callBack(message.message);
    //         })
    //   },
    //   navigationDelegate: (NavigationRequest request) {
    //     print("request $request");
    //     return NavigationDecision.navigate;
    //   },
    // );
  }
}
