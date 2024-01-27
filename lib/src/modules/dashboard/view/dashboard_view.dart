import 'package:learning_app/src/app/app.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: buildPage(state.index),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.index,
            onTap: (value) => context.read<DashboardBloc>().add(IndexEvent(value)),
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: bottomTabs,
          ),
        );
      },
    );
  }

  Widget buildPage(int index) {
    List pages = [
      Center(
        child: Text('Home'),
      ),
      Center(
        child: Text('Search'),
      ),
      Center(
        child: Text('Courses'),
      ),
      Center(
        child: Text('Chat'),
      ),
      Center(
        child: Text('Profile'),
      ),
    ];
    return pages[index];
  }
}
