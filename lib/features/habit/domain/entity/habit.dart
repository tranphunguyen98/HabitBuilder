import 'package:equatable/equatable.dart';

import 'package:habit/features/habit/domain/entity/habit_progress.dart';

import 'habit_frequency.dart';
import 'habit_motivation.dart';
import 'habit_remind.dart';

class Habit extends Equatable {
  final String id;
  final String name;
  final String icon;
  final String checkInImage;
  final int missionDayUnit;
  final int missionDayCheckInStep;
  final int missionDayTarget;
  final int typeHabitMissionDayCheckIn;
  final int typeHabitGoal;
  final bool isFinished;
  final List<HabitRemind>? reminds;
  final List<HabitProgressItem>? habitProgress;
  final HabitMotivation? motivation;
  final HabitFrequency frequency;

  Habit({
    required this.id,
    required this.icon,
    required this.checkInImage,
    required this.name,
    required this.missionDayUnit,
    required this.missionDayCheckInStep,
    required this.missionDayTarget,
    required this.typeHabitMissionDayCheckIn,
    required this.typeHabitGoal,
    required this.frequency,
    this.reminds,
    this.motivation,
    this.habitProgress,
    this.isFinished = false,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        icon,
        checkInImage,
        reminds,
        motivation,
        missionDayUnit,
        missionDayCheckInStep,
        missionDayTarget,
        habitProgress,
        frequency,
        typeHabitMissionDayCheckIn,
        isFinished,
        typeHabitGoal,
      ];
}
