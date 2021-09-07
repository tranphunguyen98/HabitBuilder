import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habit/core/error/exception.dart';
import 'package:habit/core/error/failure.dart';
import 'package:habit/core/network/network_info.dart';
import 'package:habit/features/habit/data/datasources/habit_local_data_source.dart';
import 'package:habit/features/habit/data/datasources/habit_remote_data_source.dart';
import 'package:habit/features/habit/data/models/habit_model.dart';
import 'package:habit/features/habit/data/repositories/habit_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixtures_reader.dart';
import 'habit_repository_impl_test.mocks.dart';

@GenerateMocks([HabitRemoteDataSource, HabitLocalDataSource, NetworkInfo])
void main() {
  late HabitRepositoryImpl habitRepositoryImpl;
  late MockHabitRemoteDataSource mockHabitRemoteDataSource;
  late MockHabitLocalDataSource mockHabitLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockHabitLocalDataSource = MockHabitLocalDataSource();
    mockHabitRemoteDataSource = MockHabitRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();

    habitRepositoryImpl = HabitRepositoryImpl(
      habitRemoteDataSource: mockHabitRemoteDataSource,
      habitLocalDataSource: mockHabitLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestOnOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestOnOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getHabitList', () {
    final tHabitModel = HabitModel.fromJson(getJsonFromFile('habit.json'));
    final tHabitModelList = List.generate(5, (index) => tHabitModel).toList();

    test('should check if the device is online', () async {
      // arrange
      when(mockHabitRemoteDataSource.getHabitList())
          .thenAnswer((realInvocation) async => tHabitModelList);
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      habitRepositoryImpl.getHabitList();
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestOnOnline(() {
      test(
          'should return remote data when the call to remote data source is success',
          () async {
        // arrange
        when(mockHabitRemoteDataSource.getHabitList())
            .thenAnswer((realInvocation) async => tHabitModelList);
        // act
        final result = await habitRepositoryImpl.getHabitList();
        // assert
        verify(mockHabitRemoteDataSource.getHabitList());
        expect(result, equals(Right(tHabitModelList)));
      });

      test(
          'should cache the data locally when the call to remote data source is success',
          () async {
        // arrange
        when(mockHabitRemoteDataSource.getHabitList())
            .thenAnswer((realInvocation) async => tHabitModelList);
        // act
        await habitRepositoryImpl.getHabitList();
        // assert
        verify(mockHabitRemoteDataSource.getHabitList());
        verify(mockHabitLocalDataSource.cacheHabitList(tHabitModelList));
      });

      test(
          'should return failure when the call to remote data source is success',
          () async {
        // arrange
        when(mockHabitRemoteDataSource.getHabitList())
            .thenThrow(ServerException());
        // act
        final result = await habitRepositoryImpl.getHabitList();
        // assert
        verify(mockHabitRemoteDataSource.getHabitList());
        verifyZeroInteractions(mockHabitLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestOnOffline(() {
      test(
          'should return last locally cached data when the cached data is present',
          () async {
        // arrange
        when(mockHabitLocalDataSource.getAllHabit())
            .thenAnswer((realInvocation) async => tHabitModelList);
        // act
        final result = await habitRepositoryImpl.getHabitList();
        // assert
        verifyZeroInteractions(mockHabitRemoteDataSource);
        verify(mockHabitLocalDataSource.getAllHabit());
        expect(result, equals(Right(tHabitModelList)));
      });

      test('should return CachedFailure when there is no cached data present',
          () async {
        // arrange
        when(mockHabitLocalDataSource.getAllHabit())
            .thenThrow(CacheException());
        // act
        final result = await habitRepositoryImpl.getHabitList();
        // assert
        verify(mockHabitLocalDataSource.getAllHabit());
        verifyZeroInteractions(mockHabitRemoteDataSource);
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });
}
