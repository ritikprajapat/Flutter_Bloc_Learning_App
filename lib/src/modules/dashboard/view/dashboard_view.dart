import 'package:learning_app/src/app/app.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

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
      HomeView(),
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
