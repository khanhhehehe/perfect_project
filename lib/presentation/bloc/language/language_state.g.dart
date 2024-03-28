// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LanguageStateCWProxy {
  LanguageState currentLanguage(LanguageApp currentLanguage);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LanguageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LanguageState(...).copyWith(id: 12, name: "My name")
  /// ````
  LanguageState call({
    LanguageApp? currentLanguage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLanguageState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLanguageState.copyWith.fieldName(...)`
class _$LanguageStateCWProxyImpl implements _$LanguageStateCWProxy {
  final LanguageState _value;

  const _$LanguageStateCWProxyImpl(this._value);

  @override
  LanguageState currentLanguage(LanguageApp currentLanguage) =>
      this(currentLanguage: currentLanguage);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LanguageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LanguageState(...).copyWith(id: 12, name: "My name")
  /// ````
  LanguageState call({
    Object? currentLanguage = const $CopyWithPlaceholder(),
  }) {
    return LanguageState(
      currentLanguage: currentLanguage == const $CopyWithPlaceholder() ||
              currentLanguage == null
          ? _value.currentLanguage
          // ignore: cast_nullable_to_non_nullable
          : currentLanguage as LanguageApp,
    );
  }
}

extension $LanguageStateCopyWith on LanguageState {
  /// Returns a callable class that can be used as follows: `instanceOfLanguageState.copyWith(...)` or like so:`instanceOfLanguageState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LanguageStateCWProxy get copyWith => _$LanguageStateCWProxyImpl(this);
}
