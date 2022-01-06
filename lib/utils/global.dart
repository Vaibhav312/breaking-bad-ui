
import 'package:cached_network_image/cached_network_image.dart';
import 'package:demoproject/controllers/auth_controller.dart';
import 'package:demoproject/controllers/routes/navigation_routes.dart';
import 'package:demoproject/services/core_service.dart';
import 'package:demoproject/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';


final authController = AuthController.getInstance();
final navigationRoutes = NavigationRoutes.getInstance();
final coreService = CoreService.getInstance();


showAlertBox({required BuildContext context, String? message, route}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(message ?? ""),
          actions: <Widget>[
            TextButton(
              child: const Text("Ok"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      });
}

getNetworkImage(String url) {
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) =>
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
    placeholder: (context, url) =>
    const Center(
        child: SizedBox(
            height: 20, width: 20, child: CircularProgressIndicator())),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
  openLink(url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        enableJavaScript: true,
      );
    } else {
      showToast('Unable to open $url link', Styles.titleColor);
      // throw 'Could not launch ${url}';
      print('Could not launch ${url}');
    }

}

showToast(text, color) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 18.0);
}