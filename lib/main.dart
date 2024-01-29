import 'src/app/app.dart';

void main() async {
  await Global.init();
  runApp(const App());
}
