import 'package:habit/features/habit/data/models/habit_model.dart';
import 'package:habit/features/habit/domain/entity/habit.dart';

abstract class HabitLocalDataSource {
  Future<void> addHabit(Habit habit);
  Future<void> updateHabit(Habit habit);
  Future<void> checkInHabit(Habit habit, String chosenDay, [int checkInAmount]);
  Future<void> resetHabitOnDay(Habit habit, String chosenDay);
  Future<Habit> getDetailHabit(String id);
  Future<void> saveHabits(List<Habit> habits);
  Future<List<Habit>> getAllHabit();
  Future<void> clearOffline();
  Future<void> deletePermanentlyHabit(Habit habit);
  Future<void> updateHabitAsync(Habit habit);
  Future<void> cacheHabitList(List<HabitModel> habitList);
}
