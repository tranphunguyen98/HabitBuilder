import 'package:habit/features/habit/data/datasources/habit_remote_data_source.dart';
import 'package:habit/features/habit/domain/entity/habit.dart';
import 'package:habit/features/habit/data/models/habit_model.dart';
import 'package:http/http.dart';

class HabitRemoteDataSourceImpl implements HabitRemoteDataSource {
  final Client client;

  HabitRemoteDataSourceImpl({required this.client});

  @override
  Future<bool> addHabit(Habit habit) {
    // TODO: implement addHabit
    throw UnimplementedError();
  }

  @override
  Future<void> deleteHabit(Habit habit) {
    // TODO: implement deleteHabit
    throw UnimplementedError();
  }

  @override
  Future<Habit> getDetailHabit(String habitId) {
    // TODO: implement getDetailHabit
    throw UnimplementedError();
  }

  @override
  Future<List<HabitModel>> getHabitList() {
    // TODO: implement getHabitList
    throw UnimplementedError();
  }

  @override
  Future<Habit> updateHabit(Habit habit) {
    // TODO: implement updateHabit
    throw UnimplementedError();
  }
}
