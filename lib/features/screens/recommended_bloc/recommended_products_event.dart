part of 'recommended_products_bloc.dart';

@immutable
abstract class RecommendedProductsEvent extends Equatable {}

class GetRecommendedProducts extends RecommendedProductsEvent {
  @override
  List<Object?> get props => [];
}
