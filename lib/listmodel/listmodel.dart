import 'package:equatable/equatable.dart';

class Listmodel extends Equatable {
  final String id;
  final String value;
  final bool isdeleting;
  final bool isfavourite;
  const Listmodel(
      {required this.id,
      required this.value,
      this.isdeleting = false,
      this.isfavourite = false});

  Listmodel copyWith(
      {String? id, String? value, bool? isdeleting, bool? isfavourite}) {
    return Listmodel(
        id: id ?? this.id,
        value: value ?? this.value,
        isdeleting: isdeleting ?? this.isdeleting,
        isfavourite: isfavourite ?? this.isfavourite);
  }

  @override
  List<Object?> get props => [
        id,
        value,
        isdeleting,
        isfavourite,
      ];
}
