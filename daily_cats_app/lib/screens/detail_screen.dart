import 'package:daily_cats_app/models/cat.dart';
import 'package:flutter/material.dart';

final List<String> replies = [
  "저 근엄한 눈빛!",
  "어느 고양이별에서 왔니?",
  "집사로서 주인님께 충성할뿐...",
  "냥이님 날 가져요~~~",
  "왕족 고양이라서 '오히려 좋아'!",
  "중요한 건 꺾이지 않는 냥미모",
];

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.cat,});
  final Cat cat;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cat.title),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 10.0,
                right: 10.0,
              ),
              physics: const ClampingScrollPhysics(),
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    widget.cat.link,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.cat.name,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Color(
                          0xFF777777,
                        )
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                          ),
                          onPressed: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                          },
                        ),
                        Text(
                          widget.cat.likeCount.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "댓글 ${widget.cat.replyCount}개",
                ),
                ...List.generate(
                  replies.length,
                  (int index) => Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "익명",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.0),
                        ),
                        Text(
                          replies[index],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Text(
                    "${widget.cat.created.year}년 ${widget.cat.created.month}월 ${widget.cat.created.day}일",
                    style: const TextStyle(
                      color: Color(0xFFAAAAAA)
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  color: Theme.of(context).canvasColor,
                  child: const TextField(
                    autocorrect: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 5.0,
                        bottom: 5.0,
                        left: 10.0,
                      ),
                      border: OutlineInputBorder(),
                      hintText: "댓글 작성",
                      suffixIcon: Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}