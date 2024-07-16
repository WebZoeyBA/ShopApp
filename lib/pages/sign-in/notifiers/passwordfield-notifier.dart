import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'passwordfield-notifier.g.dart';

//final passwordVisibilityProvider =
//    StateNotifierProvider<PasswordVisibilityController, bool>(
//        (ref) => PasswordVisibilityController());
//
//class PasswordVisibilityController extends StateNotifier<bool> {
//  PasswordVisibilityController()
//      : super(true); // Initially, the password is obscured
//
//  void toggleVisibility() {
//    state =
//        !state; // Toggle the state between true (visible) and false (obscured)
//  }
//}

@riverpod
class PasswordVisibilityControl extends _$PasswordVisibilityControl {
  @override
  bool build() {
    return true;
  }

  void toggleVisibility() {
    state = !state;
  }
}
