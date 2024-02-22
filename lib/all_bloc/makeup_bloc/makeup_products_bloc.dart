import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/repository/makeup_repository.dart';
import 'package:meta/meta.dart';

part 'makeup_products_event.dart';
part 'makeup_products_state.dart';

class MakeupProductsBloc
    extends Bloc<MakeupProductsEvent, MakeupProductsState> {
  final MakeupProductsRepository makeupProductsRepository;
  MakeupProductsBloc(this.makeupProductsRepository)
      : super(MakeupProductsInitial()) {
    on<MakeupProductsEvent>((event, emit) async {
      try {
        emit(MakeupProductsLoading());
        ProductResponse makeupproductResponse =
            await makeupProductsRepository.getMakeupProducts();
        emit(MakeupProductsLoaded(makeupproductResponse));
      } catch (e) {
        emit(MakeupProductsError(e.toString()));
      }
    });
  }
}
