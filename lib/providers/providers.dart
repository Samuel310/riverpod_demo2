import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_demo2/providers/pincode_provider/pincode_provider.dart';
import 'package:riverpod_demo2/providers/pincode_provider/pincode_state.dart';
import 'package:riverpod_demo2/repositories/pincode_repo.dart';

class Providers {
  static final pincodeProvider =
      StateNotifierProvider<PincodeProvider, PincodeState>((ref) {
    return PincodeProvider(PincodeRepository(Client()));
  });
}
