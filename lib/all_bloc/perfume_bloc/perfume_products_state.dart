part of 'perfume_products_bloc.dart';

@immutable
abstract class PerfumeProductsState extends Equatable{}

class PerfumeProductsInitial extends PerfumeProductsState {
@override
List<Object?> get props => [];
}

class PerfumeProductsLoading extends PerfumeProductsState {
  @override
  List<Object?> get props => [];
}

class PerfumeProductsLoaded extends PerfumeProductsState {
  late final ProductResponse perfumeproductResponse;
  PerfumeProductsLoaded(this.perfumeproductResponse);
  @override
  List<Object?> get props => [perfumeproductResponse];
}

class PerfumeProductsError extends PerfumeProductsState {
  final String error;

  PerfumeProductsError(this.error);

  @override
  List<Object?> get props => [error];
}