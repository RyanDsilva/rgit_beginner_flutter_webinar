import 'package:flutter/material.dart';
import 'package:rgit_flutter/models/user.model.dart';
import 'package:rgit_flutter/services/user.service.dart';

class UserScreen extends StatefulWidget {
  final int id;
  const UserScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final UserService _userService = UserService();
  User? user;
  bool isLoading = true;

  @override
  void initState() {
    _userService.getUserDetails(widget.id).then((_user) {
      setState(() {
        user = _user;
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : user != null
                  ? Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(user!.avatar!),
                            radius: 60,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${user!.first_name} ${user!.last_name}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            user!.email!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
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
