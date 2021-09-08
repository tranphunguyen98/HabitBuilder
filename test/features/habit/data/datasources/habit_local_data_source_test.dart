import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:habit/core/error/exception.dart';
import 'package:habit/features/habit/data/local/habit_local_data_source_impl.dart';
import 'package:habit/features/habit/data/models/habit_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixtures_reader.dart';
import 'habit_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late HabitLocalDataSourceImpl localDataSourceImpl;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    localDataSourceImpl = HabitLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
  });

  group('getLastHabitList', () {
    final tHabitList = List.generate(
        5, (int index) => HabitModel.fromJson(getJsonFromFile('habit.json')));
    test(
        'should return list of habit from SharePreferences when there is one in the cache',
        () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(
        getStringFromFile('habit_list.json'),
      );
      // act
      final result = await localDataSourceImpl.getAllHabit();
      // assert
      verify(mockSharedPreferences.getString('CACHED_HABIT_LIST'));
      expect(result, tHabitList);
    });
    test('should throw a CacheExeption when there is not a cached value',
        () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      // act
      final call = localDataSourceImpl.getAllHabit;
      // assert
      expect(() => call(), throwsA(TypeMatcher<CacheException>()));
    });
  });

  group('cacheHabitList', () {
    final tHabitList = List.generate(
        5, (int index) => HabitModel.fromJson(getJsonFromFile('habit.json')));
    test('should call SharedPreferences to cache the data', () async {
      // arrange
      when(mockSharedPreferences.setString(any, any))
          .thenAnswer((realInvocation) async => true);
      // act
      localDataSourceImpl.cacheHabitList(tHabitList);
      // assert
      final expectedJsonString =
          json.encode(tHabitList.map((e) => e.toJson()).toList());
      verify(mockSharedPreferences.setString(
        kCachedHabitListKey,
        expectedJsonString,
      ));
    });
  });
}
