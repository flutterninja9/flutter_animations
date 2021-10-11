import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animations/src/explicit_animations/stopwatch_app/components/reset_button.dart';
import 'package:flutter_animations/src/explicit_animations/stopwatch_app/components/start_stop_button.dart';
import 'package:flutter_animations/src/explicit_animations/stopwatch_app/components/stopwatch_renderer.dart';

class StopwatchComponent extends StatefulWidget {
  const StopwatchComponent({Key? key}) : super(key: key);
  @override
  _StopwatchComponentState createState() => _StopwatchComponentState();
}

class _StopwatchComponentState extends State<StopwatchComponent>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  Duration _elapsed = Duration.zero;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _ticker = this.createTicker((elapsed) {
      _elapsed = elapsed;
      setState(() {});
    });
  }

  void startTimer() {
    _ticker.start();
    _isRunning = true;
    setState(() {});
  }

  void stopTimer() {
    _ticker.stop();
    _isRunning = false;
    setState(() {});
  }

  void resetTimer() {
    _ticker.stop();
    _elapsed = Duration.zero;
    _isRunning = false;
    setState(() {});
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final _radius = constraints.maxHeight / 2;
        return Stack(
          children: [
            StopWatchRenderer(
              elapsed: _elapsed,
              radius: _radius,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                height: 60,
                width: 60,
                child: ResetButton(
                  onPressed: () => resetTimer(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                height: 60,
                width: 60,
                child: StartStopButton(
                  onPressed: () {
                    if (_isRunning) {
                      stopTimer();
                    } else {
                      startTimer();
                    }
                  },
                  isRunning: _isRunning,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
