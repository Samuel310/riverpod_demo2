import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo2/models/pincode_info.dart';
import 'package:riverpod_demo2/providers/pincode_provider/pincode_state.dart';
import 'package:riverpod_demo2/repositories/pincode_repo.dart';

class PincodeProvider extends StateNotifier<PincodeState> {
  final PincodeRepository _pincodeRepository;

  PincodeProvider(this._pincodeRepository)
      : super(
          PincodeState(
            isLoading: false,
            pincodeInfo: null,
            errorMsg: null,
            pincode: null,
          ),
        );

  void loadPincodeInfo({required String pincode}) async {
    try {
      if (state.isLoading) return;
      state = PincodeState(
        isLoading: true,
        pincodeInfo: null,
        errorMsg: null,
        pincode: null,
      );
      PincodeInfo pincodeInfo = await _pincodeRepository.getPincodeDetails(
        pincode: pincode,
      );
      state = PincodeState(
        isLoading: false,
        pincodeInfo: pincodeInfo,
        errorMsg: null,
        pincode: pincode,
      );
    } catch (e) {
      state = PincodeState(
        isLoading: false,
        pincodeInfo: null,
        pincode: null,
        errorMsg: e.toString(),
      );
    }
  }
}
