import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habit/features/habit/domain/entity/habit.dart';
import 'package:habit/features/habit/domain/entity/habit_frequency.dart';
import 'package:habit/features/habit/domain/repositories/habit_repository.dart';
import 'package:habit/features/habit/domain/usecases/get_habit_list.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_habit_list_test.mocks.dart';

@GenerateMocks([HabitRepository])
void main() {
  late GetHabitList getHabitList;
  late MockHabitRepository mockHabitRepository;

  setUp(() {
    mockHabitRepository = MockHabitRepository();
    getHabitList = GetHabitList(mockHabitRepository);
  });

  final tHabitFrequency = HabitFrequency(typeFrequency: 0);
  final tHabit = Habit(
    id: 'id',
    iconUrl: 'iconUrl',
    checkInImage: 'checkInImage',
    name: 'name',
    missionDayUnit: 0,
    missionDayCheckInStep: 1,
    missionDayTarget: 1,
    typeHabitMissionDayCheckIn: 0,
    typeHabitGoal: 0,
    createdAt: DateTime.now().toIso8601String(),
    updatedAt: DateTime.now().toIso8601String(),
    frequency: tHabitFrequency,
  );

  final tHabitList = List.generate(5, (index) => tHabit).toList();

  test('should get habit list from the repository', () async {
    when(mockHabitRepository.getHabitList())
        .thenAnswer((realInvocation) async => Right(tHabitList));

    final result = await getHabitList.execute();

    // UseCase should simply return whatever was returned from the Repository
    expect(result, Right(tHabitList));
    // Verify that the method has been called on the Repository
    verify(mockHabitRepository.getHabitList());
    // Only the above method should be called and nothing more.
    verifyNoMoreInteractions(mockHabitRepository);
  });
}
