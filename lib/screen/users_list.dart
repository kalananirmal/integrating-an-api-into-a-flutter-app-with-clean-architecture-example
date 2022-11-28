import 'package:Users/screen/user_details.dart';
import 'package:flutter/material.dart';
import 'package:Users/models/user.dart';
import 'package:Users/services/user_services.dart';

class UsersList extends StatefulWidget {
  UsersList({
    super.key,
  });

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              expandedHeight: 200,
              centerTitle: true,
              backgroundColor: Colors.teal,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('assets/images/user_img.png',
                    fit: BoxFit.cover),
                title: const Text('Users List'),
                centerTitle: true,
                titlePadding: const EdgeInsets.only(
                  bottom: 8.5,
                ),
                collapseMode: CollapseMode.pin,
              ),
            ),
          ],
          body: FutureBuilder<List<User>?>(
              future: UsersServices.getUsers(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  List<User>? users = snapshot.data;
                  return ListView.builder(
                      itemCount: users!.length,
                      itemBuilder: (context, index) {
                        User user = users[index];
                        return Card(
                          elevation: 5,
                          shadowColor: Colors.teal,
                          color: Colors.white,
                          child: ListTile(
                            title: Text(
                              user.firstname,
                            ),
                            subtitle: Text(
                              user.lastname,
                              style: const TextStyle(color: Colors.cyan),
                            ),
                            leading: CircleAvatar(
                              backgroundColor: Colors.amberAccent,
                              child: Image.network(user.avatar),
                            ),
                            trailing:
                                const Icon(Icons.arrow_circle_right_outlined),
                            onTap: () {
                              showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25),
                                  ),
                                ),
                                context: context,
                                builder: (context) => UserDetail(user: user),
                              );
                            },
                          ),
                        );
                      });
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
    );
  }
}
