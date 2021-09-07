import 'package:dartz/dartz.dart';
import 'package:habit/core/error/exception.dart';
import 'package:habit/core/error/failure.dart';
import 'package:habit/core/network/network_info.dart';
import 'package:habit/features/habit/data/datasources/habit_local_data_source.dart';
import 'package:habit/features/habit/data/datasources/habit_remote_data_source.dart';
import 'package:habit/features/habit/domain/entity/habit.dart';
import 'package:habit/features/habit/domain/repositories/habit_repository.dart';

class HabitRepositoryImpl extends HabitRepository {
  final HabitRemoteDataSource habitRemoteDataSource;
  final HabitLocalDataSource habitLocalDataSource;
  final NetworkInfo networkInfo;

  HabitRepositoryImpl({
    required this.habitRemoteDataSource,
    required this.habitLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<void> addHabit(Habit habit) {
    // TODO: implement addHabit
    throw UnimplementedError();
  }

  @override
  Future<void> clearOffline() {
    // TODO: implement clearOffline
    throw UnimplementedError();
  }

  @override
  Future<void> deleteHabit(Habit habit) {
    // TODO: implement deleteHabit
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Habit>> getDetailHabit(String id) {
    // TODO: implement getDetailHabit
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Habit>>> getHabitList() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteHabitList = await habitRemoteDataSource.getHabitList();
        habitLocalDataSource.cacheHabitList(remoteHabitList);
        return Right(remoteHabitList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localHabitList = await habitLocalDataSource.getAllHabit();
        return Right(localHabitList);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<void> habitCheckIn(Habit habit, String chosenDay,
      [int? checkInAmount]) {
    // TODO: implement habitCheckIn
    throw UnimplementedError();
  }

  @override
  Future<void> resetHabitOnDay(Habit habit, String chosenDay) {
    // TODO: implement resetHabitOnDay
    throw UnimplementedError();
  }

  @override
  Future<void> saveDataOnLocal() {
    // TODO: implement saveDataOnLocal
    throw UnimplementedError();
  }

  @override
  Future<void> updateHabit(Habit habit) {
    // TODO: implement updateHabit
    throw UnimplementedError();
  }
}
