import '../../../../app/app.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

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
              Column(
                children: [
                  Text(
                    'Login',
                    style: AppStyles.tsBlackMedium24,
                  ),
                  SizedBox(height: 18),
                  CommonTextField(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  CommonTextField(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_red_eye,
                      ),
                    ),
                    padding: EdgeInsets.only(bottom: 12),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Forgot Password?'),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 2,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '  To Continue with  ',
                        style: AppStyles.tsBlackMedium16,
                      ),
                      Expanded(
                        child: Divider(
                          height: 2,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        AppImages.google,
                        height: 52,
                      ),
                      Image.asset(
                        AppImages.apple,
                        height: 58,
                      ),
                      Image.asset(
                        AppImages.facebook,
                        height: 42,
                      ),
                    ],
                  ),
                  SizedBox(height: 36),
                  CommonFilledButton(
                    onPressed: () {},
                    label: 'Login',
                  ),
                ],
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have account?"),
                  TextButton(
                    onPressed: () {},
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
