import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habit/core/network/network_info.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([Connectivity])
void main() {
  late NetworkInfoImpl networkInfoImpl;
  late MockConnectivity mockConnectivity;
  setUp(() {
    mockConnectivity = MockConnectivity();
    networkInfoImpl = NetworkInfoImpl(mockConnectivity);
  });

  group('isConnected', () {
    test(
        'should return true when connectivity return ConnectivityResult.mobile',
        () async {
      // arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.mobile);
      // act
      final result = await networkInfoImpl.isConnected;
      // assert
      verify(mockConnectivity.checkConnectivity());
      expect(result, true);
    });
    test('should return true when connectivity return ConnectivityResult.wifi',
        () async {
      // arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);
      // act
      final result = await networkInfoImpl.isConnected;
      // assert
      verify(mockConnectivity.checkConnectivity());
      expect(result, true);
    });
    test('should return false when connectivity return ConnectivityResult.none',
        () async {
      // arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);
      // act
      final result = await networkInfoImpl.isConnected;
      // assert
      verify(mockConnectivity.checkConnectivity());
      expect(result, false);
    });
  });
}
