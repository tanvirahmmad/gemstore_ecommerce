part of 'splash_screens_bloc.dart';

@immutable
abstract class SplashScreensState {}

abstract class SplashStateActionState extends SplashScreensState {}

class SplashScreensInitial extends SplashScreensState {}

class GetStartedButtonNavigatetoIntropageOneState
    extends SplashStateActionState {}
