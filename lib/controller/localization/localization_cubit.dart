import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalizationState extends Equatable {
  final Locale locale;

  const LocalizationState({required this.locale});

  LocalizationState copyWith({Locale? locale}) {
    return LocalizationState(locale: locale ?? this.locale);
  }

  @override
  List<Object?> get props => [locale];
}

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(const LocalizationState(locale: Locale('en')));

  void switchToEnglish() {
    emit(state.copyWith(locale: const Locale('en')));
  }

  void switchToArabic() {
    emit(state.copyWith(locale: const Locale('ar')));
  }
}
