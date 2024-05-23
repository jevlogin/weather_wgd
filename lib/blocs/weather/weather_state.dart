part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {}

class WeatherInitialState extends WeatherState{
  @override
  List<Object?> get props => [];
}

class WeatherLoadingState extends WeatherState{
  @override
  List<Object?> get props => [];
}

class WeatherFailureState extends WeatherState{
  @override
  List<Object?> get props => [];
}

class WeatherSuccessState extends WeatherState{
  WeatherSuccessState(this.weather);

  final Weather weather;


  @override
  List<Object?> get props => [weather];
}
