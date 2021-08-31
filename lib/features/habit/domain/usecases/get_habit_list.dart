import 'package:dartz/dartz.dart';
import 'package:habit/core/error/failure.dart';
import 'package:habit/features/habit/domain/entity/habit.dart';
import 'package:habit/features/habit/domain/repositories/habit_repository.dart';

class GetHabitList {
  final HabitRepository repository;
  GetHabitList(this.repository);

  Future<Either<Failure, List<Habit>>> execute() async {
    return await repository.getHabitList();
  }
}
