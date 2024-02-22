part of 'sports_products_bloc.dart';

@immutable
abstract class SportsProductsState extends Equatable {}

class SportsProductsInitial extends SportsProductsState {
@override
List<Object?> get props => [];
}

class SportsProductsLoading extends SportsProductsState {
  @override
  List<Object?> get props => [];
}

class SportsProductsLoaded extends SportsProductsState {
  late final ProductResponse sportsproductResponse;
  SportsProductsLoaded(this.sportsproductResponse);
  @override
  List<Object?> get props => [sportsproductResponse];
}

class SportsProductsError extends SportsProductsState {
  final String error;

  SportsProductsError(this.error);

  @override
  List<Object?> get props => [error];
}