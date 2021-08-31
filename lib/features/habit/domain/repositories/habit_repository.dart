import 'package:dartz/dartz.dart';
import 'package:habit/core/error/failure.dart';

import '../entity/habit.dart';

abstract class HabitRepository {
  Future<void> addHabit(Habit habit);

  Future<Either<Failure, Habit>> getDetailHabit(String id);

  Future<Either<Failure, List<Habit>>> getHabitList();

  Future<void> updateHabit(Habit habit);

  Future<void> deleteHabit(Habit habit);

  Future<void> resetHabitOnDay(Habit habit, String chosenDay);

  Future<void> habitCheckIn(Habit habit, String chosenDay, [int checkInAmount]);

  Future<void> saveDataOnLocal();

  Future<void> clearOffline();
}
