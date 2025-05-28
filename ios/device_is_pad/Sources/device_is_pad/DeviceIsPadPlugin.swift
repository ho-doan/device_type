import Flutter
import UIKit

public class DeviceIsPadPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "device_is_pad", binaryMessenger: registrar.messenger())
    let instance = DeviceIsPadPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "deviceType":
        let type = UIDevice.current.userInterfaceIdiom
        switch type{
        case .phone:
            result("iOS phone")
        case .pad:
            result("iOS pad")
        @unknown default:
            result("iOS unknown")
        }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
