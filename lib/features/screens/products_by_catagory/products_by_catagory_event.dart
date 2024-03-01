part of 'products_by_catagory_bloc.dart';

@immutable
abstract class ProductsByCatagoryEvent extends Equatable {}
class GetProductsByCategory extends ProductsByCatagoryEvent {

  final int page;
  final CatagoryName catagoryName;

  GetProductsByCategory ({required this.catagoryName, this.page = 1});

  @override
  List<Object?> get props => [];
}
