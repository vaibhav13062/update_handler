import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_redirect/store_redirect.dart';

class InnerFunctions {
   BuildContext context;
  InnerFunctions(this.context);

  showIosPopUp( bool forceUpdate, String title,
      String content, String? iosAppId) {
    return showDialog(
        barrierDismissible: !forceUpdate,
        context: context,
        builder: (builder) {
          return CupertinoAlertDialog(
            title: Text(
              title,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
            content: Text(
              content,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
            actions: forceUpdate
                ? [
                    CupertinoDialogAction(
                      child: const Text("Update Now"),
                      onPressed: () {
                        if (iosAppId == null) {
                          StoreRedirect.redirect();
                        } else {
                          StoreRedirect.redirect(iOSAppId: iosAppId);
                        }
                      },
                    )
                  ]
                : [
                    CupertinoDialogAction(
                      child: const Text("Update Now"),
                      onPressed: () {
                        if (iosAppId == null) {
                          StoreRedirect.redirect();
                        } else {
                          StoreRedirect.redirect(iOSAppId: iosAppId);
                        }
                      },
                    ),
                    CupertinoDialogAction(
                      child: const Text("Not Now"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
          );
        });
  }

  showAndroidPopUp( bool forceUpdate, String title,
      String content, String? androidAppId) {
    return showDialog(
        barrierDismissible: !forceUpdate,
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text(
              title,
              maxLines: 1,
              // textAlign: TextAlign.center,
            ),
            content: Text(
              content,
              maxLines: 3,
              // textAlign: TextAlign.center,
            ),
            actions: forceUpdate
                ? [
                    TextButton(
                      child: const Text("Update Now"),
                      onPressed: () {
                        if (androidAppId == null) {
                          StoreRedirect.redirect();
                        } else {
                          StoreRedirect.redirect(androidAppId: androidAppId);
                        }
                      },
                    )
                  ]
                : [
                    TextButton(
                      child: const Text("Update Now"),
                      onPressed: () {
                        if (androidAppId == null) {
                          StoreRedirect.redirect();
                        } else {
                          StoreRedirect.redirect(androidAppId: androidAppId);
                        }
                      },
                    ),
                    TextButton(
                      child: const Text("Not Now"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
          );
        });
  }
}
