part of 'get_all_products_bloc.dart';

@immutable
abstract class GetAllProductsEvent extends Equatable {}

class GetAllProducts extends GetAllProductsEvent {

  final int page;
  final ProductTags producTags;

  GetAllProducts({required this.producTags, this.page = 1});

  @override
  List<Object?> get props => [];
}
