part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {}

class FetchWeatherEvent extends WeatherEvent {
  FetchWeatherEvent(this.position);

  final Position position;

  @override
  List<Object?> get props => [position];
}

