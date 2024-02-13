part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class CatagoriesLoadingState extends HomeState {}

class CatagoriesLoadedState extends HomeState {
  final CatagoryModels  catagorymodel;
  const CatagoriesLoadedState(this.catagorymodel);
  @override
  List<Object?> get props => [catagorymodel];
}

class CatagoriesLoadingErrorState extends HomeState {
  final String errormessege;
  const CatagoriesLoadingErrorState(this.errormessege);
  @override
  List<Object?> get props => [errormessege];
}

class BannerLoadingState extends HomeState {}

class BannerLoadedState extends HomeState {
  late List<BannerProducts> products ;

   BannerLoadedState(this.products);
  @override
  List<Object?> get props => [products];
}

class BannerLoadingErrorState extends HomeState {
  late String ermessege;
  BannerLoadingErrorState(this.ermessege);
  @override
  List<Object?> get props => [ermessege];
}
