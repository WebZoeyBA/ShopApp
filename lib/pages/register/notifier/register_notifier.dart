import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_ecommerce/pages/register/notifier/register_state.dart';
part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  RegisterState build() {
    return RegisterState();
  }

  void onNameChange(name) {
    state = state!.copyWith(username: name);
  }

  void onEmailChange(email) {
    state = state!.copyWith(email: email);
  }

  void onPasswordChange(pass) {
    state = state!.copyWith(password: pass);
  }

  void onRePasswordChange(repass) {
    state = state!.copyWith(rePassword: repass);
  }
}
