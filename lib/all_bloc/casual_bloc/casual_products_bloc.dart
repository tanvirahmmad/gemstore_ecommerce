import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:meta/meta.dart';

part 'casual_products_event.dart';
part 'casual_products_state.dart';

class CasualProductsBloc extends Bloc<CasualProductsEvent, CasualProductsState> {
  CasualProductsBloc() : super(CasualProductsInitial()) {
    on<CasualProductsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
