part of 'jeans_products_bloc.dart';

@immutable
abstract class JeansProductsState extends Equatable {}

class JeansProductsInitial extends JeansProductsState {
@override
List<Object?> get props => [];
}

class JeansProductsLoading extends JeansProductsState {
  @override
  List<Object?> get props => [];
}

class JeansProductsLoaded extends JeansProductsState {
  late final ProductResponse JeansproductResponse;
  JeansProductsLoaded(this.JeansproductResponse);
  @override
  List<Object?> get props => [JeansproductResponse];
}

class JeansProductsError extends JeansProductsState {
  final String error;
  JeansProductsError(this.error);
  @override
  List<Object?> get props => [error];
}
