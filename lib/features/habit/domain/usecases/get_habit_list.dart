import 'package:dartz/dartz.dart';
import 'package:habit/core/error/failure.dart';
import 'package:habit/core/usecases/usecases.dart';
import 'package:habit/features/habit/domain/entity/habit.dart';
import 'package:habit/features/habit/domain/repositories/habit_repository.dart';

class GetHabitList extends UseCase<List<Habit>, NoParams> {
  final HabitRepository repository;
  GetHabitList(this.repository);

  @override
  Future<Either<Failure, List<Habit>>> call(NoParams noParams) async {
    return await repository.getHabitList();
  }
}
