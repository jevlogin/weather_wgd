import 'package:bloc/bloc.dart';

import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<WeatherState> emit) async {
    emit(state.clone());
  }
}
