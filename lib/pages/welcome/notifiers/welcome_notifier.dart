import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'welcome_notifier.g.dart';

@riverpod
class IndexDot extends _$IndexDot {
  //final indexProvider = StateProvider<int>((ref) => 0);
  @override
  int build() {
    return 0;
  }

  void changeValue(int value) {
    state = value;
  }
}
