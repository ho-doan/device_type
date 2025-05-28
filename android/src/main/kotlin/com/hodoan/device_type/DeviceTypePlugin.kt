package com.hodoan.device_type

import android.content.Context
import android.content.res.Configuration
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** DeviceTypePlugin */
class DeviceTypePlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "device_type")
    context = flutterPluginBinding.applicationContext
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "deviceType") {
      val screenLayout = context.resources.configuration.screenLayout
      val screenSize = screenLayout and Configuration.SCREENLAYOUT_SIZE_MASK
      val isTablet = screenSize >= Configuration.SCREENLAYOUT_SIZE_LARGE
      result.success("Android ${if( isTablet) "pad" else "phone"}")
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
