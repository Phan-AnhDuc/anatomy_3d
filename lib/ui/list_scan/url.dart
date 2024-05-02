import 'package:anatomy_ar/const/ar_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';

class Image3D extends StatefulWidget {
  const Image3D({
    Key? key,
  }) : super(key: key);

  @override
  State<Image3D> createState() => _Image3DState();
}

class _Image3DState extends State<Image3D> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  @override
  void initState() {
    super.initState();
    requestPermistion();
  }

  void requestPermistion() async {
    await Permission.camera.request();
    await Permission.microphone.request();
    await Permission.videos.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: InAppWebView(
            key: webViewKey,
            initialUrlRequest: URLRequest(url: Uri.parse('https://sketchfab.com/3d-models/anatomy-in-action-study-01-8a55729648454e6b9f9169d6222db8da')),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                mediaPlaybackRequiresUserGesture: false,
              ),
            ),
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
            androidOnPermissionRequest: (InAppWebViewController controller, String origin, List<String> resources) async {
              return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
            }),
      ),
      SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: IgnorePointer(
            child: Container(
          color: OneColors.bHA,
        )),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 190,
          width: MediaQuery.of(context).size.width,
          child: IgnorePointer(
              child: Container(
            color: OneColors.bHA,
          )),
        ),
      ),
    ]));
  }
}
