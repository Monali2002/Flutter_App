import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../services/models/chat_list_model.dart';
import '../widgets/small_text.dart';

class ChatlistPage extends StatelessWidget {
  ChatlistPage({Key? key}) : super(key: key);

  List<ChatListModel> chatList = [];

  void _getInitialInfo() {
    chatList = ChatListModel.getChatList();
  }


  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      body: ListView(
        children: [
          _searchList(),
          SizedBox(
            height: 15,
          ),
          _favorite(),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              SizedBox(
                height: 56,
                width: 374,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 20),
                      child: SmallText(text: 'Chat list'),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8, right: 32),
                          child: SvgPicture.asset('assets/icons/menu-05.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, right: 32),
                          child: SvgPicture.asset(
                              'assets/icons/layout-grid-01.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, right: 12),
                          child:
                          SvgPicture.asset('assets/icons/plus-circle.svg'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            itemCount: chatList.length,
            padding: const EdgeInsets.only(left: 20, right: 20),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                height: 72,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      chatList[index].imgPath,
                      width: 40,
                      height: 40,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SmallText(
                          text: chatList[index].name,
                          textColor: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      width: 67,
                      height: 24,
                      color: Color(0xffF3F5F7),
                      child: Text(
                        chatList[index].text,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Sora',
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Row _favorite() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 20),
              child: SmallText(text: 'Favorite'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 15),
              child: Image.asset(
                'assets/icons/chevron-right.png',
                height: 24,
                width: 24,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 10),
          child: SmallText(
            text: 'See all',
            textColor: Color(0xffEC8B33),
          ),
        ),
      ],
    );
  }

  Column _searchList() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70, left: 8),
          child: SizedBox(
            height: 120,
            width: 326,
            child: Text(
              'Unlock the\npower of AI ✨',
              style: TextStyle(
                fontFamily: 'Sora',
                fontWeight: FontWeight.w700,
                fontSize: 40,
              ),
            ),
          ),
        ),

        //search
        Container(
          margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: const Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0)
          ]),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Search ',
              hintStyle: const TextStyle(
                color: Color(0xffDDDADA),
                fontSize: 14,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/search.svg'),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
            ),
          ),
        )
      ],
    );
  }
}
