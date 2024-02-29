part of 'recommended_products_bloc.dart';

@immutable
abstract class RecommendedProductsEvent extends Equatable {
 const RecommendedProductsEvent();
}

class GetRecommendedProducts extends RecommendedProductsEvent {
 final int page;

  GetRecommendedProducts({this.page = 1});

 @override
 List<Object?> get props => [];
}
