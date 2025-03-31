import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser!;
  List<String> docIDs = [];

  // Fetch document IDs and update state
  Future getDocId() async {
    List<String> tempDocIDs = [];

    await FirebaseFirestore.instance.collection('users').get().then(
          // Ensure the list is empty before adding new IDs
          (value) => value.docs.forEach(
            (document) {
              tempDocIDs.add(document.reference.id);
            },
          ),
        );
    // to reflect the changes in UI setstate is used
    setState(() {
      // this will asign the list of documentIDs into docIDs after that it is eary to use
      docIDs = tempDocIDs;
    });
  }

  @override
  void initState() {
    super.initState();
    getDocId(); // Fetch user IDs once when the widget loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(32, 65, 186, 1),
        centerTitle: true,
        title: Text(
          user.email!,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => FirebaseAuth.instance.signOut(),
              child: Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: docIDs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: GetUserData(documentId: docIDs[index]),
                    tileColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

// CRUD (Create, Read, Update, Delete) operations with Firebase
// Reading user data
class GetUserData extends StatelessWidget {
  final String documentId;
  const GetUserData({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    // Getting the collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Converting list to map
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Name: ${data['Name']}  Age: ${data['Age']}");
        }
        return LinearProgressIndicator();
      },
    );
  }
}
