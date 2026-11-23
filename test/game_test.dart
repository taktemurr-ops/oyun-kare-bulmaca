import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kare_bulmaca/oyun_kare_bulmaca.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kareBulmacaConfig.title.length, 33);
    expect(kareBulmacaConfig.tagline.length, 33);
    for (final s in kareBulmacaConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kareBulmacaConfig.gameId, kareBulmacaId);
    expect(kareBulmacaRules.gameId, kareBulmacaId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kareBulmacaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kareBulmacaId, optionalMechanics: kareBulmacaRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      kareBulmacaRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(kareBulmacaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
