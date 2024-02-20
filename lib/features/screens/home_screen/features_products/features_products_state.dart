part of 'features_products_bloc.dart';

abstract class FeaturesProductsState extends Equatable {
  const FeaturesProductsState();
}

class FeaturesProductsInitial extends FeaturesProductsState {
  @override
  List<Object> get props => [];
}

class FeaturesProductsLoading extends FeaturesProductsState {
  @override
  List<Object> get props => [];
}

class FeaturesProductsLoaded extends FeaturesProductsState {
  final ProductResponse productResponse;

  const FeaturesProductsLoaded(this.productResponse);

  @override
  List<Object> get props => [];
}

class FeaturesProductsError extends FeaturesProductsState {
  final String error;

  const FeaturesProductsError(this.error);

  @override
  List<Object> get props => [];
}
