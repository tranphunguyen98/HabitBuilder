import 'package:habit/features/habit/data/models/habit_model.dart';

abstract class HabitLocalDataSource {
  Future<void> addHabit(HabitModel habit);
  Future<void> updateHabit(HabitModel habit);
  Future<void> checkInHabit(HabitModel habit, String chosenDay, [int checkInAmount]);
  Future<void> resetHabitOnDay(HabitModel habit, String chosenDay);
  Future<HabitModel> getDetailHabit(String id);
  Future<void> saveHabits(List<HabitModel> habits);
  Future<List<HabitModel>> getAllHabit();
  Future<void> clearOffline();
  Future<void> deletePermanentlyHabit(HabitModel habit);
  Future<void> updateHabitAsync(HabitModel habit);
  Future<void> cacheHabitList(List<HabitModel> habitList);
}
