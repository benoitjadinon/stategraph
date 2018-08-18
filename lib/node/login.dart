import '../definitions.dart';
import 'package:flutter/material.dart';
import '../graph/stateGraph.dart';
import '../repository/account.dart';

class DefaultLoginState implements IState {
  @override
  Branch branch = Branch.login;
}

class LoginErrorState extends DefaultLoginState {
  String loginErrorMessage = "There was an error";
}

typedef IState LoginFunction(
    LoginRequest loginRequest, String username, String password);

class LoginNode {
  static Widget render(IState state) {
    if (state is LoginErrorState)
      return Center(
          child:
              Text(state.loginErrorMessage, textDirection: TextDirection.ltr));
    else
      return Center(
          child: FlatButton(
        child: Text(
          'Login',
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => StateGraph
            .apply(login(Account.login(StateGraph.apiState()), "username", "password")),
      ));
  }

  static IState login(
      LoginRequest loginRequest, String username, String password) {
    final result = loginRequest(username, password);

    if (result == false) {
      // Do some logic
      return LoginErrorState();
    }

    return DefaultLoginState();
  }
}