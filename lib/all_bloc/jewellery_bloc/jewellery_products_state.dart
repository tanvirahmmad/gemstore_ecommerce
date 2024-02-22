part of 'jewellery_products_bloc.dart';

@immutable
abstract class JewelleryProductsState extends Equatable {}

class JewelleryProductsInitial extends JewelleryProductsState {
@override
List<Object?> get props => [];
}

class JewelleryProductsLoading extends JewelleryProductsState {
  @override
  List<Object?> get props => [];
}

class JewelleryProductsLoaded extends JewelleryProductsState {
  late final ProductResponse jewelleryproductResponse;
  JewelleryProductsLoaded(this.jewelleryproductResponse);
  @override
  List<Object?> get props => [jewelleryproductResponse];
}

class JewelleryProductsError extends JewelleryProductsState {
  final String error;

  JewelleryProductsError(this.error);

  @override
  List<Object?> get props => [error];
}