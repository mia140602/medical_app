// import 'package:camera/camera.dart';
// import 'package:chatapp/CustomUI/CameraUI.dart';

import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/config/app_constant.dart';
import 'package:medical_app/model/response/messaging/messaging_res.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../../../model/appointment_model.dart';
import '../../../../model/mess_model.dart';
import '../../../../services/chat_service.dart';



class ChatPage extends StatefulWidget {
  final AppointmentModel appointment;
  ChatPage({super.key,required this.appointment});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
late ApiService apiService;



  late Future<List<ReceivedMessage>> msgList;
  bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;
  // List<MessageModel> messages = [];
  TextEditingController _controller = TextEditingController();
  // ScrollController _scrollController = ScrollController();
  List<Message> messages=[];


  late IO.Socket socket;
  @override
  void initState() {
    super.initState();
    apiService = ApiService();

     apiService.getInitialMessages(widget.appointment.id);
    
    fetchMessages();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
   

   
   
  }

   void sendMessage(String content, String appointmentId) async {
  print('Content: $content');
  print('Appointment ID: $appointmentId');
  try {
    await apiService.sendMessage(content, appointmentId, widget.appointment.doctor.id);
    
  } catch (error) {
    print('Lỗi khi gửi tin nhắn: $error');
    // Hiển thị thông báo lỗi
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Lỗi khi gửi tin nhắn: $error'),
      ),
    );
  }
}
void fetchMessages() async {
  try {
    final messages = await apiService.getMessagesByAppointmentId(widget.appointment.id);
    setState(() {
      this.messages = messages;
       print('setState được gọi, có ${messages.length} tin nhắn');
    });
  } catch (error) {
    // Hiển thị thông báo lỗi
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Lỗi khi tải tin nhắn: $error'),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        Scaffold(
          backgroundColor:Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              leadingWidth: 70,
              titleSpacing: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                    CircleAvatar(
                     
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: NetworkImage(widget.appointment.doctor.avatar??''))
                        ),
                       
                      ),
                      radius: 20,
                      backgroundColor: Colors.blueGrey,
                    ),
                  ],
                ),
              ),
              title: InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.appointment.doctor.userName,
                        style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "last seen today at 12:05",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              actions: [
                // IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
                // IconButton(icon: Icon(Icons.call), onPressed: () {}),
                PopupMenuButton<String>(
                  padding: EdgeInsets.all(0),
                  onSelected: (value) {
                    print(value);
                  },
                  itemBuilder: (BuildContext contesxt) {
                    return [
                    const  PopupMenuItem(
                        child: Text("View Contact"),
                        value: "View Contact",
                      ),
                    const  PopupMenuItem(
                        child: Text("Media, links, and docs"),
                        value: "Media, links, and docs",
                      ),
                     const PopupMenuItem(
                        child: Text("Whatsapp Web"),
                        value: "Whatsapp Web",
                      ),
                      const PopupMenuItem(
                        child: Text("Search"),
                        value: "Search",
                      ),
                      const PopupMenuItem(
                        child: Text("Mute Notification"),
                        value: "Mute Notification",
                      ),
                     const PopupMenuItem(
                        child: Text("Wallpaper"),
                        value: "Wallpaper",
                      ),
                    ];
                  },
                ),
              ],
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              child: Column(
                children: [
                  Expanded(
                    // height: MediaQuery.of(context).size.height - 150,
                    child: StreamBuilder<List<Message>>(
                      stream: apiService.messagesStream,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        final messages = snapshot.data ?? [];
                        if (messages.isEmpty) {
                          return const Center(child: Text('Không có tin nhắn nào'));
                        }
                        // Cuộn đến vị trí cuối cùng sau khi dữ liệu đã sẵn sàng
                        // WidgetsBinding.instance.addPostFrameCallback((_) {
                        //   if (_scrollController.hasClients) {
                        //     _scrollController.animateTo(
                        //       _scrollController.position.maxScrollExtent,
                        //       duration: Duration(milliseconds: 500),
                        //       curve: Curves.easeOut,
                        //     );
                        //   }
                        // });

                        return ListView.builder(
                          // controller: _scrollController,
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final message = messages[index];
                            if (message.isCurrentUser == true) {
                                // Hiển thị tin nhắn ở bên phải với màu xanh
                                return  ChatBubble(
                                  clipper: ChatBubbleClipper3(type: BubbleType.sendBubble),
                                  alignment: Alignment.topRight,
                                  margin: EdgeInsets.only(top: 20),
                                  backGroundColor: AppColor.mainColor,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                                    ),
                                    child: Text(
                                    message.content,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              } else {
                                // Hiển thị tin nhắn ở bên trái
                                return  ChatBubble(
                                    clipper: ChatBubbleClipper3(type: BubbleType.receiverBubble),
                                    backGroundColor: Color(0xffE7E7ED),
                                    margin: EdgeInsets.only(top: 20),
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                                      ),
                                      child: Text(
                                        message.content,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  );
                              }
                          },
                        );
                      },
                    ),
                    
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Card(
                                  margin: EdgeInsets.only(
                                      left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: TextFormField(
                                    controller: _controller,
                                    focusNode: focusNode,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    onChanged: (value) {
                                      if (value.length > 0) {
                                        setState(() {
                                          sendButton = true;
                                        });
                                      } else {
                                        setState(() {
                                          sendButton = false;
                                        });
                                      }
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type a message",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      prefixIcon: IconButton(
                                        icon: Icon(
                                          show
                                              ? Icons.keyboard
                                              : Icons.emoji_emotions_outlined,
                                        ),
                                        onPressed: () {
                                          if (!show) {
                                            focusNode.unfocus();
                                            focusNode.canRequestFocus = false;
                                          }
                                          setState(() {
                                            show = !show;
                                          });
                                        },
                                      ),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.attach_file),
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (builder) =>
                                                      bottomSheet());
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.camera_alt),
                                            onPressed: () {
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (builder) =>
                                              //             CameraApp()));
                                            },
                                          ),
                                        ],
                                      ),
                                      contentPadding: EdgeInsets.all(5),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 8,
                                  right: 2,
                                  left: 2,
                                ),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: AppColor.mainColor,
                                  child: IconButton(
                                    icon: Icon(
                                      sendButton ? Icons.send : Icons.mic,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      if (sendButton) {
                                        // _scrollController.animateTo(
                                        //     _scrollController
                                        //         .position.maxScrollExtent,
                                        //     duration:
                                        //         Duration(milliseconds: 300),
                                        //     curve: Curves.easeOut);
                                        sendMessage(_controller.text, widget.appointment.id);
                                          _controller.clear();
                                          setState(() {
                                            sendButton = false;
                                          });
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // show ? emojiSelect() : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              onWillPop: () {
                if (show) {
                  setState(() {
                    show = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
          
          
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, "Audio"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.location_pin, Colors.teal, "Location"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.person, Colors.blue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icons,
              // semanticLabel: "Help",
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              // fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    );
  }

  // Widget emojiSelect() {
  //   return EmojiPicker(
  //       rows: 4,
  //       columns: 7,
  //       onEmojiSelected: (emoji, category) {
  //         print(emoji);
  //         setState(() {
  //           _controller.text = _controller.text + emoji.emoji;
  //         });
  //       });
  // }
}


