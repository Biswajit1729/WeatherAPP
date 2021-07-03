import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

part 'internetconnectivity_state.dart';

class InternetconnectivityCubit extends Cubit<InternetconnectivityState> {
  InternetconnectivityCubit() : super(InternetconnectivityInitial()) {
    checkInternet();
  }

  checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      emit(InternetConnected(connect: true));
    } else if (connectivityResult == ConnectivityResult.wifi) {
      emit(InternetConnected(connect: true));
    } else {
      emit(InternetConnected(connect: false));
    }
  }
}
