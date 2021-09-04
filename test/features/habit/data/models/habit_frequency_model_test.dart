import 'package:flutter_test/flutter_test.dart';
import 'package:habit/features/habit/data/models/habit_frequency_model.dart';
import 'package:habit/features/habit/domain/entity/habit_frequency.dart';

void main() {
  final tHabitFrequencyModel = HabitFrequencyModel(typeFrequency: 1);
  test('should be subclass of HabitFrequency', () async {
    // assert
    expect(tHabitFrequencyModel, isA<HabitFrequency>());
  });
}
