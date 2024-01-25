import '../../../../app/app.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupInitial>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, there',
                      style: AppStyles.tsBlackSemiBold24,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Create a new account.',
                      style: AppStyles.tsBlackMedium16,
                    ),
                    SizedBox(height: 18),
                    CommonTextField(
                      onChanged: (value) => context.read<SignupBloc>().add(SignupUserNameEvent(value!)),
                      hintText: 'Username',
                      prefixIcon: Icon(Icons.person),
                    ),
                    CommonTextField(
                      onChanged: (value) => context.read<SignupBloc>().add(SignupEmailEvent(value!)),
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    CommonTextField(
                      onChanged: (value) => context.read<SignupBloc>().add(SignupPasswordEvent(value!)),
                      obscureText: !context.select((SignupBloc bloc) => bloc.state.isPasswordVisible),
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () => context.read<SignupBloc>().add(SignupPasswordVisibleEvent()),
                        icon: Icon(
                          context.select((SignupBloc bloc) =>
                              bloc.state.isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                        ),
                      ),
                    ),
                    CommonTextField(
                      onChanged: (value) => context.read<SignupBloc>().add(SignupConfirmPasswordEvent(value!)),
                      obscureText: !context.select((SignupBloc bloc) => bloc.state.isConfirmPasswordVisible),
                      hintText: 'Confirm Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () => context.read<SignupBloc>().add(SignupConfirmPasswordVisibleEvent()),
                        icon: Icon(
                          context.select((SignupBloc bloc) =>
                              bloc.state.isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
                        ),
                      ),
                      padding: EdgeInsets.only(bottom: 36),
                    ),
                    CommonFilledButton(
                      onPressed: () => SignupController(context).handleSignUp(),
                      label: "Sign Up",
                    ),
                    SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: AppStyles.tsBlackSemiBold14,
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(context, "loginView"),
                          child: Text(
                            'Login',
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
