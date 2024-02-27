import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/Models/users_model.dart';
import 'package:storeapp/services/api_handler.dart';
import 'package:storeapp/widgets/user_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('Users'),
      ),
      body: FutureBuilder<List<UsersModel>>(
        future: ApiHandler.getAllUsers(), // Correct the method name
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("An error occurred: ${snapshot.error}"),
            );
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(
              child: Text("No categories available"),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                  value: snapshot.data![index], child: const UserWidget());
            },
          );
        },
      ),
    );
  }
}
