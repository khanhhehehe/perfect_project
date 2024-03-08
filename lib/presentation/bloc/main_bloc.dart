import 'package:camera_flutter/common/configs/locators.dart';
import 'package:camera_flutter/presentation/bloc/language/language_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc {
  static List<BlocProvider> allBlocs() =>
      [BlocProvider<LanguageCubit>(create: (_) => getIt<LanguageCubit>())];
}
