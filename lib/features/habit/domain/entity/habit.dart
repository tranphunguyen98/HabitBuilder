import 'package:equatable/equatable.dart';
import 'package:habit/features/habit/domain/entity/habit_progress.dart';

import 'habit_frequency.dart';
import 'habit_motivation.dart';
import 'habit_remind.dart';

class Habit extends Equatable {
  final String id;
  final String name;
  final String iconUrl;
  final String checkInImage;
  final String createdAt, updatedAt;
  final int missionDayUnit, missionDayCheckInStep, missionDayTarget;
  final int typeHabitMissionDayCheckIn, typeHabitGoal;
  final bool isFinished, isTrashed, isCreatedOnLocal;
  final List<HabitRemind>? reminds;
  final List<HabitProgressItem>? habitProgress;
  final HabitMotivation? motivation;
  final HabitFrequency frequency;

  Habit({
    required this.id,
    required this.iconUrl,
    required this.checkInImage,
    required this.name,
    required this.missionDayUnit,
    required this.missionDayCheckInStep,
    required this.missionDayTarget,
    required this.typeHabitMissionDayCheckIn,
    required this.typeHabitGoal,
    required this.createdAt,
    required this.updatedAt,
    required this.frequency,
    this.reminds,
    this.motivation,
    this.habitProgress,
    this.isFinished = false,
    this.isTrashed = false,
    this.isCreatedOnLocal = false,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        iconUrl,
        checkInImage,
        reminds,
        motivation,
        missionDayUnit,
        missionDayCheckInStep,
        missionDayTarget,
        habitProgress,
        frequency,
        typeHabitMissionDayCheckIn,
        createdAt,
        isFinished,
        isTrashed,
        isCreatedOnLocal,
        updatedAt,
        typeHabitGoal,
      ];
}
