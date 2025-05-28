import 'device_type_platform_interface.dart';

enum DeviceModel {
  pad,
  phone;

  bool get isPad => this == pad;
  bool get isPhone => this == phone;
}

class DeviceType {
  const DeviceType._();
  static final instance = DeviceType._();
  Future<DeviceModel> deviceType() async {
    final type = await DeviceTypePlatform.instance.deviceType();
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
