import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_wgd/data/data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitialState()) {
    on<FetchWeatherEvent>(_init);
  }

  void _init(FetchWeatherEvent event, emit) async {
    emit(WeatherLoadingState());
    GetIt.I<Talker>().log('WeatherLoadingState');
    try {
      WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);
      GetIt.I<Talker>().log('Created WeatherFactory - $wf');

      GetIt.I<Talker>().log('Start receive weather');
      Weather weather = await wf.currentWeatherByLocation(
        event.position.latitude,
        event.position.longitude,
      );
      GetIt.I<Talker>().log('Weather received, weather = $weather');

      emit(WeatherSuccessState(weather));
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      emit(WeatherFailureState());
    }
  }
}
