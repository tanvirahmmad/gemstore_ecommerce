part of 'casual_products_bloc.dart';

@immutable
abstract class CasualProductsState extends Equatable {}

class CasualProductsInitial extends CasualProductsState {
  @override
  List<Object?> get props => [];
}

class CasualProductsLoading extends CasualProductsState {
  @override
  List<Object?> get props => [];
}

class CasualProductsLoaded extends CasualProductsState {
  late final ProductResponse casualproductResponse;
  CasualProductsLoaded(this.casualproductResponse);
  @override
  List<Object?> get props => [casualproductResponse];
}

class CasualProductsError extends CasualProductsState {
  final String error;
  CasualProductsError(this.error);
  @override
  List<Object?> get props => [error];
}
