// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../profile/models/profile.dart';

part 'food.freezed.dart';
part 'food.g.dart';

int profileToJson(Profile profile) => profile.id;

@freezed
class Food with _$Food {
  const Food._();

  factory Food({
    @JsonKey(includeToJson: false) required int id,
    @JsonKey(includeToJson: false) required String uuid,
    required String name,
    @JsonKey(toJson: profileToJson) required Profile profile,
    @JsonKey(name: "created_at", includeToJson: false)
    required DateTime createdAt,
  }) = _Food;

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  factory Food.empty() {
    return Food(
      id: 0,
      uuid: '',
      name: "",
      profile: Profile.empty(),
      createdAt: DateTime.now(),
    );
  }

  bool get exists {
    return id != 0;
  }
}
