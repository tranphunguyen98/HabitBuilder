import 'package:equatable/equatable.dart';

class HabitProgressItem extends Equatable {
  final int currentAmount;
  final bool isDone;
  final String checkInDate;

  HabitProgressItem({
    this.currentAmount = 0,
    this.isDone = false,
    required this.checkInDate,
  });

  @override
  List<Object?> get props => [currentAmount, isDone, checkInDate];
}
