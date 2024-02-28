part of 'features_products_bloc.dart';

@immutable
abstract class FeaturesProductsEvent extends Equatable {
  const FeaturesProductsEvent();
}

class GetFeaturesProducts extends FeaturesProductsEvent {

  @override
  List<Object?> get props => [];
}

