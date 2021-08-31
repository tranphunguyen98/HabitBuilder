import 'package:equatable/equatable.dart';

class HabitFrequency extends Equatable {
  final int typeFrequency;
  final List<int>? dailyDays;
  final int? weeklyDays;

  HabitFrequency({
    required this.typeFrequency,
    this.dailyDays,
    this.weeklyDays,
  });

  @override
  List<Object?> get props => [
        typeFrequency,
        dailyDays,
        weeklyDays,
      ];
}
