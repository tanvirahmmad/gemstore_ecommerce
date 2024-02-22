part of 'shrees_products_bloc.dart';

@immutable
abstract class ShareesProductsState extends Equatable {}

class ShreesProductsInitial extends ShareesProductsState {
  @override
  List<Object?> get props => [];
}

class ShareesProductsLoading extends ShareesProductsState {
  @override
  List<Object?> get props => [];
}

class ShareesProductsLoaded extends ShareesProductsState {
  late final ProductResponse shareesproductResponse;
  ShareesProductsLoaded(this.shareesproductResponse);
  @override
  List<Object?> get props => [shareesproductResponse];
}

class ShareesProductsError extends ShareesProductsState {
  final String error;
  ShareesProductsError(this.error);
  @override
  List<Object?> get props => [error];
}
