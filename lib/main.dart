import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Controllers/timer_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TimerController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cronómetro',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TimerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TimerScreen extends StatelessWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timerController = Provider.of<TimerController>(context);
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text(
          'Contador de segundos',
        ),
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${timerController.seconds}' +
                  (timerController.seconds == 1 ? ' segundo' : ' segundos'),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                letterSpacing: 2.0,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 2,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: timerController.isRunning
                      ? null
                      : timerController.startTimer,
                  child: Text(
                      timerController.seconds == 0 ? 'Iniciar' : 'Continuar'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: timerController.isRunning
                      ? timerController.stopTimer
                      : null,
                  child: const Text('Detener'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: timerController.resetTimer,
                  child: const Text('Reiniciar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
