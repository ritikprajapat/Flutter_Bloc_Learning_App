import 'package:learning_app/src/modules/auth/login/login_controller.dart';

import '../../../../app/app.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginInitial>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back !',
                          style: AppStyles.tsBlackSemiBold24,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Login to continue',
                          style: AppStyles.tsBlackMedium16,
                        ),
                        SizedBox(height: 18),
                        CommonTextField(
                          onChanged: (value) {
                            context.read<LoginBloc>().add(EmailEvent(value!));
                          },
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                        CommonTextField(
                          onChanged: (value) {
                            context.read<LoginBloc>().add(PasswordEvent(value!));
                          },
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.visibility,
                            ),
                          ),
                          padding: EdgeInsets.only(bottom: 0),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: AppStyles.tsBlackMedium14.copyWith(
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
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
                              style: AppStyles.tsBlackSemiBold16,
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
                          onPressed: () {
                            LoginController(context).handleLogin('email');
                          },
                          label: 'Login',
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have account?",
                          style: AppStyles.tsBlackSemiBold14,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpView(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: AppStyles.tsBlackSemiBold14.copyWith(
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
