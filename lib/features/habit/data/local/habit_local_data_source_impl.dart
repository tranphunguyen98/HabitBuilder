import 'dart:convert';

import 'package:habit/core/error/exception.dart';
import 'package:habit/features/habit/data/datasources/habit_local_data_source.dart';
import 'package:habit/features/habit/data/models/habit_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kCachedHabitListKey = 'CACHED_HABIT_LIST';

class HabitLocalDataSourceImpl extends HabitLocalDataSource {
  final SharedPreferences sharedPreferences;

  HabitLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> addHabit(HabitModel habit) {
    // TODO: implement addHabitModel
    throw UnimplementedError();
  }

  @override
  Future<void> cacheHabitList(List<HabitModel> habitList) async {
    sharedPreferences.setString(
      kCachedHabitListKey,
      json.encode(habitList.map((e) => e.toJson()).toList()),
    );
  }

  @override
  Future<void> checkInHabit(HabitModel habit, String chosenDay,
      [int? checkInAmount]) {
    // TODO: implement checkInHabitModel
    throw UnimplementedError();
  }

  @override
  Future<void> clearOffline() {
    // TODO: implement clearOffline
    throw UnimplementedError();
  }

  @override
  Future<void> deletePermanentlyHabit(HabitModel habit) {
    // TODO: implement deletePermanentlyHabitModel
    throw UnimplementedError();
  }

  @override
  Future<List<HabitModel>> getAllHabit() {
    final jsonString = sharedPreferences.getString('CACHED_HABIT_LIST');
    if (jsonString != null) {
      return Future.value((json.decode(jsonString) as List)
          .map((e) => HabitModel.fromJson(e))
          .toList());
    }
    throw CacheException();
  }

  @override
  Future<HabitModel> getDetailHabit(String id) {
    // TODO: implement getDetailHabitModel
    throw UnimplementedError();
  }

  @override
  Future<void> resetHabitOnDay(HabitModel habit, String chosenDay) {
    // TODO: implement resetHabitModelOnDay
    throw UnimplementedError();
  }

  @override
  Future<void> saveHabits(List<HabitModel> habits) {
    // TODO: implement saveHabits
    throw UnimplementedError();
  }

  @override
  Future<void> updateHabit(HabitModel habit) {
    // TODO: implement updateHabit
    throw UnimplementedError();
  }

  @override
  Future<void> updateHabitAsync(HabitModel habit) {
    // TODO: implement updateHabitAsync
    throw UnimplementedError();
  }
}
