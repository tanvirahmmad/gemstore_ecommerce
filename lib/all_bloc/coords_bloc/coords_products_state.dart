part of 'coords_products_bloc.dart';

@immutable
abstract class CoordsProductsState extends Equatable {}

class CoordsProductsInitial extends CoordsProductsState {
  @override

  List<Object?> get props => [];
}

class CoordsProductsLoading extends CoordsProductsState {
  @override
  List<Object?> get props => [];
}

class CoordsProductsLoaded extends CoordsProductsState {
  late final ProductResponse coordsproductResponse;
  CoordsProductsLoaded(this.coordsproductResponse);
  @override
  List<Object?> get props => [coordsproductResponse];
}

class CoordsProductsError extends CoordsProductsState {
  final String error;
  CoordsProductsError(this.error);
  @override
  List<Object?> get props => [error];
}
