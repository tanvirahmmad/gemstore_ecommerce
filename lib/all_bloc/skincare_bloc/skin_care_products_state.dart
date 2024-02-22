part of 'skin_care_products_bloc.dart';

@immutable
abstract class SkinCareProductsState extends Equatable {}

class SkinCareProductsInitial extends SkinCareProductsState {
@override
List<Object?> get props => [];
}

class SkinCareProductsLoading extends SkinCareProductsState {
  @override
  List<Object?> get props => [];
}

class SkinCareProductsLoaded extends SkinCareProductsState {
  late final ProductResponse skinCareproductResponse;
  SkinCareProductsLoaded(this.skinCareproductResponse);
  @override
  List<Object?> get props => [skinCareproductResponse];
}

class SkinCareProductsError extends SkinCareProductsState {
  final String error;

  SkinCareProductsError(this.error);

  @override
  List<Object?> get props => [error];
}