import 'package:flutter/material.dart';
import 'package:rs_onboard/components/custom_bottom_sheet.dart';

class Home extends StatefulWidget {
  const Home({this.imageUrl, this.username, Key? key}) : super(key: key);
  final String? username;
  final String? imageUrl;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    widget.username == null ? _modalBottomSheetMenu() : null;
  }

  void _modalBottomSheetMenu() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      customBottomSheet(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('By Rittik'),
        actions: [
          widget.username == null
              ? IconButton(
                  onPressed: () {
                    customBottomSheet(context: context);
                  },
                  icon: const Icon(Icons.person),
                )
              : CircleAvatar(
                  backgroundImage: NetworkImage(widget.imageUrl!),
                ),
        ],
      ),
      body: Center(
        child:
            Text(widget.username == null ? 'Home' : widget.username.toString()),
      ),
    );
  }
}
