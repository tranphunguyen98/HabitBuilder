import 'package:habit/features/habit/data/models/habit_frequency_model.dart';
import 'package:habit/features/habit/domain/entity/habit.dart';

class HabitModel extends Habit {
  HabitModel({
    required String id,
    required String name,
    required String icon,
    required String checkInImage,
    required int missionDayUnit,
    required int missionDayCheckInStep,
    required int missionDayTarget,
    required int typeHabitMissionDayCheckIn,
    required int typeHabitGoal,
    required HabitFrequencyModel frequency,
    bool isFinished = false,
  }) : super(
          id: id,
          name: name,
          icon: icon,
          checkInImage: checkInImage,
          missionDayUnit: missionDayUnit,
          missionDayTarget: missionDayTarget,
          frequency: frequency,
          missionDayCheckInStep: missionDayCheckInStep,
          typeHabitGoal: typeHabitGoal,
          typeHabitMissionDayCheckIn: typeHabitMissionDayCheckIn,
          isFinished: isFinished,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'checkInImage': checkInImage,
      'missionDayUnit': missionDayUnit,
      'missionDayCheckInStep': missionDayCheckInStep,
      'missionDayTarget': missionDayTarget,
      'typeHabitMissionDayCheckIn': typeHabitMissionDayCheckIn,
      'typeHabitGoal': typeHabitGoal,
      'isFinished': isFinished,
      'frequency': (frequency as HabitFrequencyModel).toJson(),
    };
  }

  factory HabitModel.fromJson(Map<String, dynamic> map) {
    return HabitModel(
      id: map['id'],
      name: map['name'],
      icon: map['icon'],
      checkInImage: map['checkInImage'],
      missionDayUnit: map['missionDayUnit'],
      missionDayCheckInStep: map['missionDayCheckInStep'],
      missionDayTarget: map['missionDayTarget'],
      typeHabitMissionDayCheckIn: map['typeHabitMissionDayCheckIn'],
      typeHabitGoal: map['typeHabitGoal'],
      isFinished: map['isFinished'],
      frequency: HabitFrequencyModel.fromJson(map['frequency']),
    );
  }
}
