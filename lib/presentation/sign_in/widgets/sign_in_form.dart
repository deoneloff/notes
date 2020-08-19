// import 'dart:ffi';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:notes/application/auth/auth_bloc.dart';
import 'package:notes/domain/core/errors.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../application/auth/sign_in_form/sign_in_form_bloc.dart';
import '../../../router.gr.dart';

class SignInForm extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    final Logger log = Logger('SignInForm');
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              FlushbarHelper.createError(
                message: failure.map(
                  cancelledByUser: (_) => 'Cancelled',
                  serverError: (_) => 'Server error',
                  emailAlreadyInUse: (_) => 'Email already in use',
                  invalidEmailAndPasswordCombination: (_) =>
                      'Invalid email and password combination',
                  emailNotSpecified: (_) => 'Email not specified',
                ),
              ).show(context);
            },
            (_) {
              context
                  .bloc<AuthBloc>()
                  .add(const AuthEvent.authCheckRequested());
              ExtendedNavigator.of(context).replace(Routes.notesOverviewPage);
            },
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidate: state.showErrorMessages,
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              const Text(
                '📝',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 130),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                ),
                autocorrect: false,
                onChanged: (value) => context
                    .bloc<SignInFormBloc>()
                    .add(SignInFormEvent.emailChanged(value)),
                validator: (_) => context
                    .bloc<SignInFormBloc>()
                    .state
                    .emailAddress
                    .value
                    .fold(
                      (f) => f.maybeMap(
                        invalidEmail: (_) => 'Invalid Email',
                        orElse: () => null,
                      ),
                      (_) => null,
                    ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
                autocorrect: false,
                obscureText: true,
                onChanged: (value) => context
                    .bloc<SignInFormBloc>()
                    .add(SignInFormEvent.passwordChanged(value)),
                validator: (_) =>
                    context.bloc<SignInFormBloc>().state.password.value.fold(
                          (f) => f.maybeMap(
                            shortPassword: (_) => 'Short Password',
                            orElse: () => null,
                          ),
                          (_) => null,
                        ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        context.bloc<SignInFormBloc>().add(
                              const SignInFormEvent
                                  .signInWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text('SIGN IN'),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        context.bloc<SignInFormBloc>().add(
                              const SignInFormEvent
                                  .registerWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text('REGISTER'),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                onPressed: () {
                  context
                      .bloc<SignInFormBloc>()
                      .add(const SignInFormEvent.signInWithGooglePressed());
                },
                color: Colors.lightBlue,
                child: const Text(
                  'SIGN IN WITH GOOGLE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (Platform.isIOS) const Divider(),
              if (Platform.isIOS)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SignInWithAppleButton(
                    style: SignInWithAppleButtonStyle.whiteOutlined,
                    onPressed: () {
                      context
                          .bloc<SignInFormBloc>()
                          .add(const SignInFormEvent.signInWithApplePressed());
                    },
                  ),
                ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Text('CRASH'),
                  onPressed: () {
                    log.finer('CRASH!!!');
                    Crashlytics.instance.log('Testing Crashlytics...');
                    analytics.logEvent(
                      name: 'button_press',
                      parameters: {'sign_in_form': 'Testing Crashlytics'},
                    );
                    // throw TestingFirebaseCrashLytics();
                  },
                ),
              ),
              const Divider(),
              if (state.isSubmitting) ...[
                const SizedBox(height: 8),
                const LinearProgressIndicator(),
              ]
            ],
          ),
        );
      },
    );
  }
}
