part of 'recommended_products_bloc.dart';

@immutable
abstract class RecommendedProductsState extends Equatable {}

class RecommendedProductsInitial extends RecommendedProductsState {
  @override
  List<Object?> get props => [];
}
class ProductsInitial extends RecommendedProductsState{
  @override
  List<Object> get props => [];
}

class RecommendedProductsLoading extends RecommendedProductsState {
  @override
  List<Object> get props => [];
}

class RecommendedProductsLoaded extends RecommendedProductsState {
  final ProductResponse recommendedProductResponse;

   RecommendedProductsLoaded(this.recommendedProductResponse);

  @override
  List<Object> get props => [];
}

class RecommendedProductsError extends RecommendedProductsState {
  final String error;

   RecommendedProductsError(this.error);

  @override
  List<Object> get props => [error];
}
