part of 'shoes_products_bloc.dart';

@immutable
abstract class ShoesProductsState extends Equatable{}

class ShoesProductsInitial extends ShoesProductsState {
@override
List<Object?> get props => [];
}

class ShoesProductsLoading extends ShoesProductsState {
  @override
  List<Object?> get props => [];
}

class ShoesProductsLoaded extends ShoesProductsState {
  late final ProductResponse shoesproductResponse;
  ShoesProductsLoaded(this.shoesproductResponse);
  @override
  List<Object?> get props => [shoesproductResponse];
}

class ShoesProductsError extends ShoesProductsState {
  final String error;
  ShoesProductsError(this.error);
  @override
  List<Object?> get props => [error];
}
