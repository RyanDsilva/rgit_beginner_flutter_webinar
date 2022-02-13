import 'package:flutter/material.dart';
import 'package:rgit_flutter/models/user.model.dart';
import 'package:rgit_flutter/screens/user.screen.dart';
import 'package:rgit_flutter/services/user.service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserService _userService = UserService();
  bool isLoading = true;
  List<User>? users = [];

  @override
  void initState() {
    _userService.getUsers().then((_users) {
      setState(() {
        users = _users;
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : users != null
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(users![index].avatar!),
                          ),
                          title: Text(
                              '${users![index].first_name} ${users![index].last_name}'),
                          subtitle: Text(users![index].email!),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return UserScreen(id: index + 1);
                              }),
                            );
                          },
                        );
                      },
                      itemCount: users!.length,
                      shrinkWrap: true,
                    )
                  : const Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 50,
                      ),
                    ),
        ),
      ),
    );
  }
}
