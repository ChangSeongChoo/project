import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joysports/services/shared_preferences_service.dart';
import 'package:state_notifier/state_notifier.dart';
//처음 시작화면인지 아닌지 보여주는 것
final onboardingViewModelProvider =
    StateNotifierProvider<OnboardingViewModel, bool>((ref) {
  final sharedPreferencesService = ref.watch(sharedPreferencesServiceProvider);
  return OnboardingViewModel(sharedPreferencesService);
});

class OnboardingViewModel extends StateNotifier<bool> {
  OnboardingViewModel(this.sharedPreferencesService)
      : super(sharedPreferencesService.isOnboardingComplete());
  final SharedPreferencesService sharedPreferencesService;

  Future<void> completeOnboarding() async {
    await sharedPreferencesService.setOnboardingComplete();
    state = true;
  }

  bool get isOnboardingComplete => state;
}
