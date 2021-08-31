import 'package:equatable/equatable.dart';

class HabitMotivation extends Equatable {
  final String content;
  final List<String>? images;

  const HabitMotivation({
    required this.content,
    this.images,
  });

  @override
  List<Object?> get props => [content, images];
}
