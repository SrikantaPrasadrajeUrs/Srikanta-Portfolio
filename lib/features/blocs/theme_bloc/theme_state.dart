part of 'theme_bloc.dart';

class ThemeState extends Equatable{
  final ThemeType themeType;
  final ThemeData themeData;
  const ThemeState({required this.themeData, required this.themeType});
  @override
  List<Object?> get props => [themeData, themeType];
}