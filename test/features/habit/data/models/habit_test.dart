import 'package:flutter_test/flutter_test.dart';
import 'package:habit/features/habit/data/models/habit_frequency_model.dart';
import 'package:habit/features/habit/data/models/habit_model.dart';
import 'package:habit/features/habit/domain/entity/habit.dart';

import '../../../../fixtures/fixtures_reader.dart';

void main() {
  final tHabitFrequencyModel = HabitFrequencyModel(typeFrequency: 1);

  final tHabitModel = HabitModel(
    id: 'id',
    icon: 'icon',
    checkInImage: 'checkInImage',
    name: 'name',
    missionDayUnit: 0,
    missionDayCheckInStep: 1,
    missionDayTarget: 1,
    typeHabitMissionDayCheckIn: 0,
    typeHabitGoal: 0,
    frequency: tHabitFrequencyModel,
  );
  test('should be subclass of Habit', () async {
    // assert
    expect(tHabitModel, isA<Habit>());
  });

  group('json', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final jsonMap = getJsonFromFile('habit.json');
      // act
      final result = HabitModel.fromJson(jsonMap);
      // assert
      expect(result, tHabitModel);
    });
    test('should return a JSON map containing the proper data', () async {
      // arrange
      final jsonMap = getJsonFromFile('habit.json');
      // act
      final result = tHabitModel.toJson();
      // assert
      expect(result, jsonMap);
    });
  });
}
