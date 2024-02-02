import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Avatar with Animation'),
        ),
        body: Center(
          child: AvatarWithAnimation(),
        ),
      ),
    );
  }
}

class AvatarWithAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: animatiList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return AvatarItem(index: index);
            },
          ),
        ),
      ],
    );
  }
}

class AvatarItem extends StatefulWidget {
  final int index;

  const AvatarItem({Key? key, required this.index}) : super(key: key);

  @override
  _AvatarItemState createState() => _AvatarItemState();
}

class _AvatarItemState extends State<AvatarItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600), // Faster animation
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleRightSign() {
    setState(() {
      animatiList[widget.index].select = !animatiList[widget.index].select!;
      if (animatiList[widget.index].select!) {
        _controller.reset();
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  void _toggleAddIcon() {
    setState(() {
      animatiList[widget.index].select = !animatiList[widget.index].select!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.list),
      trailing: Stack(
        children: [
          GestureDetector(
            onTap: () {
              _toggleAddIcon();
            },
            child: Container(
              height: 50,
              width: 40,
              child: animatiList[widget.index].select == false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.black,
                        ),
                      ],
                    )
                  : Container(),
            ),
          ),
          Container(
            height: 50,
            width: 40,
            child: GestureDetector(
              onTap: () {
                _toggleRightSign();
              },
              child: AnimatedOpacity(
                opacity: animatiList[widget.index].select! ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 600), // Faster animation
                child: RotationTransition(
                  turns: animatiList[widget.index].select!
                      ? _animation
                      : AlwaysStoppedAnimation(
                          0), // Stops rotation if not selected
                  child: const Icon(
                    Icons.check_circle,
                    color: Colors.pink,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      title: Text("${animatiList[widget.index].title}"),
    );
  }
}

class AnimationModel {
  String? title;
  bool? select;
  AnimationModel({this.select, this.title});
}

List<AnimationModel> animatiList = [
  AnimationModel(select: false, title: "Hello"),
  AnimationModel(select: false, title: "jauli"),
  AnimationModel(select: false, title: "karan"),
  AnimationModel(select: false, title: "panuddd"),
  AnimationModel(select: false, title: "babalii"),
];
