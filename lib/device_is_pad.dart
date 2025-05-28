import 'device_is_pad_platform_interface.dart';

enum DeviceModel {
  pad,
  phone;

  bool get isPad => this == pad;
  bool get isPhone => this == phone;
}

class DeviceIsPad {
  const DeviceIsPad._();
  static final instance = DeviceIsPad._();
  Future<DeviceModel> deviceType() async {
    final type = await DeviceIsPadPlatform.instance.deviceType();
    if (type == null) return DeviceModel.phone;
    if (type.contains('phone')) {
      return DeviceModel.phone;
    }
    if (type.contains('pad')) {
      return DeviceModel.pad;
    }
    return DeviceModel.phone;
  }
}
