
import 'package:demoproject/services/core_service.dart';
import 'package:demoproject/utils/global.dart';
import 'package:demoproject/utils/global_constants.dart';
import 'package:demoproject/utils/text_styles.dart';
import 'package:flutter/material.dart';



class AuthController {
  AuthController._();

  factory AuthController.getInstance() => _instance;
  static final AuthController _instance = AuthController._();

  showNoInternetToast(String message, String subText,
      {route}) {
   return SimpleDialog(
     title: Text(message),
     children: [
       Column(
         children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text(
               subText,
               style: TextStyles.smallText,
             ),
           ),
           const Divider(),
           TextButton(
             child: const Text("TRY AGAIN"),
             onPressed: route ??
                     () {
                   //  navigationRoutes.navigateToSplashScreen(context: context);

                   // Get.offAll(SplashScreen());
                 },
           )
         ],
       ),
     ],

   );
  }



 Future getCharacterData() async {
    return await coreService.apiService(
        method: METHOD.GET,
        baseURL: BASE_URL,
        endpoint: CHARACTERS_DATA,
        header: null,
        returnType: "characters_data",
        body: null
    );
  }

}
