import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'control_count_state.dart';

class ControlCountCubit extends Cubit<ControlCountState> {
  late int count;
  num total = 0;

  ControlCountCubit(int initialCount) : super(ControlCountInitial()) {
    count = initialCount;
  }

  static ControlCountCubit get(context) => BlocProvider.of(context);

  void _changeTotal({required num offerPrice, required num price}) {
    if (offerPrice > 0) {
      total = offerPrice * count;
    } else {
      total = price * count;
    }
  }

  void incrementCount({required num offerPrice, required num price}) {
    count++;
    _changeTotal(offerPrice: offerPrice, price: price);
    emit(ControlCountIncrement());
  }

  void decrementCount({required num offerPrice, required num price}) {
    if (count != 1) {
      count--;
    }
    _changeTotal(offerPrice: offerPrice, price: price);
    emit(ControlCountDecrement());
  }
}
