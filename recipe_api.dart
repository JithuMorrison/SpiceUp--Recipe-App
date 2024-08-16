import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewContainer extends StatefulWidget {
  final url;
  const WebViewContainer({super.key, required this.url});

  @override
  State<WebViewContainer> createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  static String widgett="Path"; // Declare widget with 'late'
  @override
  void initState() {
    super.initState();
    widgett = widget.url;
    print(widgett);
    int index = widgett.indexOf("https");
    if (index == -1) {
      widgett = widgett.replaceAll("http", "https");
    }
  }
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse(widgett));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Web View Container"),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
