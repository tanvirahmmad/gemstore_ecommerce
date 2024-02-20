part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class ProductsLoadingState extends HomeState {}

class ProductsLoadedState extends HomeState {
  final Products  products;
  const  ProductsLoadedState (this.products);


  @override
  List<Object?> get props => [products];
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
