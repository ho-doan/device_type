import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:device_is_pad/device_is_pad_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelDeviceIsPad platform = MethodChannelDeviceIsPad();
  const MethodChannel channel = MethodChannel('device_is_pad');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          return '42';
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('deviceType', () async {
    expect(await platform.deviceType(), '42');
  });
}
