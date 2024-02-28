part of 'features_products_bloc.dart';

@immutable
abstract class FeaturesProductsEvent extends Equatable {
  const FeaturesProductsEvent();
}

class GetFeaturesProducts extends FeaturesProductsEvent {
  final int page;

  const GetFeaturesProducts({this.page = 1});

  @override
  List<Object?> get props => [];
}

