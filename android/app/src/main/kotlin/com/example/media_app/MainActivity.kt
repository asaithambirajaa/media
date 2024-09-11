package com.example.media_app

import android.provider.Settings
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import java.io.File

class MainActivity: FlutterActivity() {

    private val CHANNEL = "com.example.media_app/detection"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Ensures that binaryMessenger is non-null using !! (asserts non-null)
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "isDeviceRooted") {
                result.success(isDeviceRooted())
            }else if (call.method.equals("isDeveloperModeEnabled")) {
                        result.success(isDeveloperModeEnabled());
            } else {
                result.notImplemented()
            }
        }
    }

    private fun isDeviceRooted(): Boolean {
        val paths = arrayOf(
            "/system/app/Superuser.apk",
            "/sbin/su",
            "/system/bin/su",
            "/system/xbin/su",
            "/data/local/xbin/su",
            "/data/local/bin/su",
            "/system/sd/xbin/su",
            "/system/bin/failsafe/su",
            "/data/local/su"
        )

        return paths.any { File(it).exists() }
    }

    private fun isDeveloperModeEnabled(): Boolean {
        return try {
            Settings.Global.getInt(contentResolver, Settings.Global.DEVELOPMENT_SETTINGS_ENABLED, 0) != 0
        } catch (e: Settings.SettingNotFoundException) {
            false
        }
    }
}
