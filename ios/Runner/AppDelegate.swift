import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let controller = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "com.example.media_app/detection",
                                       binaryMessenger: controller.binaryMessenger)

    channel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      if call.method == "isDeviceJailbroken" {
        result(self.isJailbroken())
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  private func isJailbroken() -> Bool {
    // Common jailbreak detection checks
    if JailbreakDetection.hasCydiaInstalled() || JailbreakDetection.canEditSystemFiles() || JailbreakDetection.hasSuspiciousFiles() {
      return true
    }
    return false
  }
}

// Helper methods for jailbreak detection
class JailbreakDetection {
  static func hasCydiaInstalled() -> Bool {
    return UIApplication.shared.canOpenURL(URL(string: "cydia://")!)
  }

  static func canEditSystemFiles() -> Bool {
    let fileManager = FileManager.default
    let testPath = "/private/jailbreakTest.txt"
    do {
      try "Jailbreak test".write(toFile: testPath, atomically: true, encoding: .utf8)
      try fileManager.removeItem(atPath: testPath)
      return true
    } catch {
      return false
    }
  }

  static func hasSuspiciousFiles() -> Bool {
    let suspiciousPaths = [
      "/Applications/Cydia.app",
      "/Library/MobileSubstrate/MobileSubstrate.dylib",
      "/bin/bash",
      "/usr/sbin/sshd",
      "/etc/apt"
    ]
    for path in suspiciousPaths {
      if FileManager.default.fileExists(atPath: path) {
        return true
      }
    }
    return false
  }
}