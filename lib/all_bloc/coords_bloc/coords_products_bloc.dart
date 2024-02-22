import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/repository/coords_repository.dart';
import 'package:meta/meta.dart';

part 'coords_products_event.dart';
part 'coords_products_state.dart';

class CoordsProductsBloc extends Bloc<CoordsProductsEvent, CoordsProductsState> {
  final CoordsProductsRepository coordsProductsRepository;
  CoordsProductsBloc(this.coordsProductsRepository) : super(CoordsProductsInitial()) {
    on<CoordsProductsEvent>((event, emit) async{
      try {
        emit(CoordsProductsLoading());
        ProductResponse coordsproductResponse=await coordsProductsRepository.getCoordsProducts();
        emit(CoordsProductsLoaded(coordsproductResponse));
      }catch(e){
        emit(CoordsProductsError(e.toString()));
      }
    });
  }
}
