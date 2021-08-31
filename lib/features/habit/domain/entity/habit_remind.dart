import 'package:equatable/equatable.dart';

class HabitRemind extends Equatable {
  final int hour;
  final int minute;

  HabitRemind({
    required this.hour,
    required this.minute,
  });

  @override
  List<Object?> get props => [hour, minute];
}
