import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

const platform = MethodChannel('com.example.media_app/detection');

class DetectionService {
  Future<Either<Map<String, bool>, Map<String, bool>>> checkRootStatus() async {
    bool rootedCheck = false;
    bool devMode = false;
    bool jailbreak = false;

    try {
      if (Platform.isAndroid) {
        rootedCheck = await isDeviceRooted();
        devMode = await isDeveloperModeEnabled();
      } else if (Platform.isIOS) {
        jailbreak = await isDeviceJailbroken();
      }
    } on PlatformException {
      // Handle the exception or set default values
      rootedCheck = false;
      devMode = false;
      jailbreak = false;

      return Left({
        'rootedCheck': rootedCheck,
        'devMode': devMode,
        'jailbreak': jailbreak,
      });
    }
    return Right({
      'rootedCheck': rootedCheck,
      'devMode': devMode,
      'jailbreak': jailbreak,
    });
  }

  Future<bool> isDeviceRooted() async {
    try {
      final bool isRooted = await platform.invokeMethod('isDeviceRooted');
      return isRooted;
    } on PlatformException catch (e) {
      log("Failed to detect root: '${e.message}'.");
      return false;
    }
  }

  Future<bool> isDeviceJailbroken() async {
    try {
      final bool isJailbroken =
          await platform.invokeMethod('isDeviceJailbroken');
      return isJailbroken;
    } on PlatformException catch (e) {
      print("Failed to detect jailbreak: '${e.message}'.");
      return false;
    }
  }

  Future<bool> isDeveloperModeEnabled() async {
    try {
      final bool isDevModeEnabled =
          await platform.invokeMethod('isDeveloperModeEnabled');
      return isDevModeEnabled;
    } on PlatformException catch (e) {
      log("Failed to detect developer mode: '${e.message}'.");
      return false;
    }
  }
}
