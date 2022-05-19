import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:update_handler/src/inner_functions.dart';

class UpdateHandler {
  UpdateHandler._();

  UpdateHandler();

  static final UpdateHandler instance = UpdateHandler._();

  String? _androidAppId;
  String? _iosAppId;

  static set androidAppId(String? value) {
    if (value == instance._androidAppId) {
      return;
    }

    instance._androidAppId = value;
  }

  static set iosAppId(String? value) {
    if (value == instance._iosAppId) {
      return;
    }

    instance._iosAppId = value;
  }

  static String? get iosAppId {
    return instance._iosAppId;
  }

  static String? get androidAppId {
    return instance._androidAppId;
  }

  // PackageInfo packageInfo = await PackageInfo.fromPlatform();
  Future<bool> isUpdateAvailable(
      {required int latestBuildNo,
      required int lastForceBuildNo,
      required BuildContext context,
      // required String latestVersion,
      String? title,
      String? content}) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    if (lastForceBuildNo > int.parse(buildNumber)) {
      //FORCE UPDATE
      if (Platform.isIOS) {
        InnerFunctions().showIosPopUp(
            context,
            true,
            title ?? "Update Available",
            content ?? "Please Update to Continue",
            iosAppId);
      } else if (Platform.isAndroid) {
        InnerFunctions().showAndroidPopUp(
            context,
            true,
            title ?? "Update Available",
            content ?? "Please Update to Continue",
            androidAppId);
      }
      return true;
    } else if (latestBuildNo > int.parse(buildNumber)) {
      if (Platform.isIOS) {
        InnerFunctions().showIosPopUp(
            context,
            false,
            title ?? "Update Available",
            content ?? "New Update is Available",
            iosAppId);
      } else if (Platform.isAndroid) {
        InnerFunctions().showAndroidPopUp(
            context,
            false,
            title ?? "Update Available",
            content ?? "New Update is Available",
            androidAppId);
      }
      //NORMAL UPDATE
      return true;
    } else {
      //NO UPDATE REQUIRED
      return false;
    }
  }
}
