import '../../../../app/app.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool visibility = true;
  @override
  Widget build(BuildContext context) {
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
                  hintText: 'Username',
                  prefixIcon: Icon(Icons.email),
                ),
                CommonTextField(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                CommonTextField(
                  obscureText: visibility,
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (visibility) {}
                    },
                    icon: Icon(
                      visibility ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                CommonTextField(
                  obscureText: true,
                  hintText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.visibility,
                    ),
                  ),
                  padding: EdgeInsets.only(bottom: 36),
                ),
                CommonFilledButton(
                  onPressed: () {},
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpView(),
                          ),
                        );
                      },
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
  }
}
