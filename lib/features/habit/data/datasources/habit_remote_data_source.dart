import 'package:habit/features/habit/data/models/habit_model.dart';
import 'package:habit/features/habit/domain/entity/habit.dart';

abstract class HabitRemoteDataSource {
  Future<bool> addHabit(Habit habit);
  Future<Habit> updateHabit(Habit habit);
  Future<Habit> getDetailHabit(String habitId);

  /// Calls the ... endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<HabitModel>> getHabitList();

  Future<void> deleteHabit(Habit habit);
}
