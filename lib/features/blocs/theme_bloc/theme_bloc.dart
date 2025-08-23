import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:srikanta_portfolio/core/constants/constants.dart';
import 'package:srikanta_portfolio/core/services/local_storage.dart';
import '../../../core/themes/app_theme.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent,ThemeState>{
  final ThemeType themeType;
  ThemeBloc({required this.themeType}):super(ThemeState(themeType: themeType, themeData: _mapThemeTypeToThemeData(themeType))){
    on<ThemeChangeEvent>(handleThemeChangeEvent);
  }

  void handleThemeChangeEvent(ThemeChangeEvent event, Emitter<ThemeState> emit){
    emit(ThemeState(themeData: _mapThemeTypeToThemeData(themeType), themeType: themeType));
    LocalStorage.setTheme(themeType);
  }

  static ThemeData _mapThemeTypeToThemeData(ThemeType themeType){
    return switch(themeType){
      ThemeType.bright=>AppTheme.lightTheme,
      ThemeType.dark=>AppTheme.darkTheme
    };
  }
}