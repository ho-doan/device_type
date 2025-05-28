import 'package:flutter_test/flutter_test.dart';
import 'package:device_type/device_type.dart';
import 'package:device_type/device_type_platform_interface.dart';
import 'package:device_type/device_type_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDeviceTypePlatform
    with MockPlatformInterfaceMixin
    implements DeviceTypePlatform {
  @override
  Future<String?> deviceType() => Future.value('42');
}

void main() {
  final DeviceTypePlatform initialPlatform = DeviceTypePlatform.instance;

  test('$MethodChannelDeviceType is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDeviceType>());
  });

  test('deviceType', () async {
    DeviceType deviceTypePlugin = DeviceType.instance;
    MockDeviceTypePlatform fakePlatform = MockDeviceTypePlatform();
    DeviceTypePlatform.instance = fakePlatform;

    expect(await deviceTypePlugin.deviceType(), '42');
  });
}
