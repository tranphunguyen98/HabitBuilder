import 'package:habit/features/habit/domain/entity/habit_frequency.dart';

class HabitFrequencyModel extends HabitFrequency {
  HabitFrequencyModel({
    required int typeFrequency,
    List<int>? dailyDays,
    int? weeklyDays,
  }) : super(
          typeFrequency: typeFrequency,
          dailyDays: dailyDays,
          weeklyDays: weeklyDays,
        );

  Map<String, dynamic> toJson() {
    return {
      'typeFrequency': typeFrequency,
      'dailyDays': dailyDays,
      'weeklyDays': weeklyDays,
    };
  }

  factory HabitFrequencyModel.fromJson(Map<String, dynamic> map) {
    return HabitFrequencyModel(
      typeFrequency: map['typeFrequency'],
      dailyDays: map['dailyDays'] as List<int>?,
      weeklyDays: map['weeklyDays'],
    );
  }
}
