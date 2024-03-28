import 'package:camera_flutter/domain/entities/language.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'language_state.g.dart';

@CopyWith()
@immutable
class LanguageState extends Equatable {
  final LanguageApp currentLanguage;
  const LanguageState({this.currentLanguage = Languages.vi});

  @override
  List<Object?> get props => [currentLanguage];
}
