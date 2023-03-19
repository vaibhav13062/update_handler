import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';
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

  Future<bool> isForceUpdateAvailable({required int lastForceBuildNo}) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    if (lastForceBuildNo > int.parse(buildNumber)) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> isSoftUpdateAvailable({required int latestBuildNo}) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String buildNumber = packageInfo.buildNumber;
    if (latestBuildNo > int.parse(buildNumber)) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> isUpdateAvailable(
      {required int latestBuildNo,
      required int lastForceBuildNo,
      required BuildContext context,
      required VoidCallback onNotNowClick,
      // required String latestVersion,
      String? title,
      String? content}) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    if (lastForceBuildNo > int.parse(buildNumber)) {
      //FORCE UPDATE
      if (Platform.isIOS) {
        InnerFunctions(context).showIosPopUp(true, title ?? "Update Available",
            content ?? "Please Update to Continue", iosAppId, () {});
      } else if (Platform.isAndroid) {
        InnerFunctions(context).showAndroidPopUp(
            true,
            title ?? "Update Available",
            content ?? "Please Update to Continue",
            androidAppId,
            () {});
      }
      return true;
    } else if (latestBuildNo > int.parse(buildNumber)) {
      if (Platform.isIOS) {
        InnerFunctions(context).showIosPopUp(false, title ?? "Update Available",
            content ?? "New Update is Available", iosAppId, onNotNowClick!);
      } else if (Platform.isAndroid) {
        InnerFunctions(context).showAndroidPopUp(
            false,
            title ?? "Update Available",
            content ?? "New Update is Available",
            androidAppId,
            onNotNowClick!);
      }
      //NORMAL UPDATE
      return true;
    } else {
      //NO UPDATE REQUIRED
      return false;
    }
  }
}
