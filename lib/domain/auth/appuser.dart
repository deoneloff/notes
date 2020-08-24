import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes/domain/core/value_object.dart';

part 'appuser.freezed.dart';

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    @required UniqueId id,
  }) = _AppUser;
}
