import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

import 'package:routins/main.dart';

void main() {
  testWidgets('Routins app başlangıç testi', (WidgetTester tester) async {
    // Test için ekran boyutunu ayarla
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    
    // Uygulamayı başlat
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Ana başlığın görünür olduğunu doğrula
    expect(find.text('Routins'), findsOneWidget);
    
    // Yeni rutin ekleme butonunun olduğunu doğrula
    expect(find.text('Yeni Rutin'), findsOneWidget);
    
    // İstatistik kartının görünür olduğunu doğrula
    expect(find.text('Bugünün İlerlemesi'), findsOneWidget);
    
    // Test sonrası temizlik
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
  });
}
