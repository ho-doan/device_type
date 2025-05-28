import Flutter
import UIKit

public class DeviceTypePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "device_type", binaryMessenger: registrar.messenger())
    let instance = DeviceTypePlugin()
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
