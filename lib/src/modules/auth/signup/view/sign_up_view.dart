import '../../../../app/app.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign Up',
                style: AppStyles.tsBlackMedium24,
              ),
              SizedBox(height: 18),
              CommonTextField(
                hintText: 'Username',
                prefixIcon: Icon(Icons.email),
              ),
              CommonTextField(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
              CommonTextField(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_red_eye,
                  ),
                ),
              ),
              CommonTextField(
                hintText: 'Confirm Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_red_eye,
                  ),
                ),
                padding: EdgeInsets.only(bottom: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
