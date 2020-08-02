import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:notes/application/sign_in_form/sign_in_form_bloc.dart';
import 'package:notes/domain/auth/i_auth_facade.dart';
import 'package:notes/domain/auth/value_objects.dart';

class MockAuthFacade extends Mock implements IAuthFacade {}

void main() {
  MockAuthFacade mockAuthFacade;

  setUp(() {
    mockAuthFacade = MockAuthFacade();
  });

  group('SignInFormBloc', () {
    const emailStr = 'jan.brandewijn@gmail.com';
    final EmailAddress emailAddress = EmailAddress(emailStr);
    const String passwordStr = '123456';
    final Password password = Password(passwordStr);
    blocTest(
      'registerWithEmailAndPasswordPressed should emit correct states in order',
      build: () => SignInFormBloc(mockAuthFacade),
      act: (bloc) {
        bloc.add(const EmailChanged(emailStr));
        bloc.add(const PasswordChanged(passwordStr));
        bloc.add(const RegisterWithEmailAndPasswordPressed());
      },
      expect: [
        isA<SignInFormState>(),
        isA<SignInFormState>(),
        SignInFormState(
          emailAddress: emailAddress,
          password: password,
          showErrorMessages: false,
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        SignInFormState(
          emailAddress: emailAddress,
          password: password,
          showErrorMessages: true,
          isSubmitting: false,
          authFailureOrSuccessOption: none(),
        ),
      ],
    );
    blocTest(
      'signInWithEmailAndPasswordPressed should emit correct states in order',
      build: () => SignInFormBloc(mockAuthFacade),
      act: (bloc) {
        bloc.add(const EmailChanged(emailStr));
        bloc.add(const PasswordChanged(passwordStr));
        bloc.add(const SignInWithEmailAndPasswordPressed());
      },
      expect: [
        isA<SignInFormState>(),
        isA<SignInFormState>(),
        SignInFormState(
          emailAddress: emailAddress,
          password: password,
          showErrorMessages: false,
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        SignInFormState(
          emailAddress: emailAddress,
          password: password,
          showErrorMessages: true,
          isSubmitting: false,
          authFailureOrSuccessOption: none(),
        ),
      ],
    );
    blocTest(
      'signInWithGooglePressed should emit correct states in order',
      build: () => SignInFormBloc(mockAuthFacade),
      act: (bloc) {
        bloc.add(const SignInWithGooglePressed());
      },
      expect: [
        isA<SignInFormState>(),
        isA<SignInFormState>(),
      ],
    );
    blocTest(
      'signInWithApplePressed should emit correct states in order',
      build: () => SignInFormBloc(mockAuthFacade),
      act: (bloc) {
        bloc.add(const SignInWithApplePressed());
      },
      expect: [
        isA<SignInFormState>(),
        isA<SignInFormState>(),
      ],
    );
  });
}
