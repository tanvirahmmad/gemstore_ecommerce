import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_screens_event.dart';
part 'splash_screens_state.dart';

class SplashScreensBloc extends Bloc<SplashScreensEvent, SplashScreensState> {
  SplashScreensBloc() : super(SplashScreensInitial()) {
    on<GetStartedButtonNavigateEvent>(getStartedButtonNavigateEvent);
  }
  FutureOr<void> getStartedButtonNavigateEvent(
    GetStartedButtonNavigateEvent event,
    Emitter<SplashScreensState> emit,
  ) {
    emit(GetStartedButtonNavigatetoIntropageOneState());
  }
}
