part of 'tops_products_bloc.dart';

@immutable
abstract class TopsProductsState extends Equatable {}

class TopsProductsInitial extends TopsProductsState {
  @override

  List<Object?> get props =>[] ;
}

class TopsProductsLoading extends TopsProductsState {
  @override
  List<Object?> get props => [];
}

class TopsProductsLoaded extends TopsProductsState {
  late final ProductResponse topsproductResponse;
  TopsProductsLoaded(this.topsproductResponse);
  @override
  List<Object?> get props => [topsproductResponse];
}

class TopsProductsError extends TopsProductsState {
  final String error;
  TopsProductsError(this.error);
  @override
  List<Object?> get props => [error];
}

