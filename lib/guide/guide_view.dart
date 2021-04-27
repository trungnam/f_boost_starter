

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_boost_new/guide/guide_action.dart';
import 'package:flutter_app_boost_new/model/APIProvider.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'guide_state.dart';

Widget buildView(GuideState state, Dispatch dispatch, ViewService viewService) {
  return buildWidget(state, dispatch, viewService);

}

Widget buildWidget(GuideState state, Dispatch dispatch, ViewService viewService) {
  GlobalKey<SliderMenuContainerState> _key =
  new GlobalKey<SliderMenuContainerState>();

  return CupertinoApp(
    debugShowCheckedModeBanner: false,
    home: Padding(
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
      child: Scaffold(
        body: SliderMenuContainer(
            appBarColor: Colors.white,
            key: _key,
            sliderMenuOpenSize: 200,
            title: Text(
              "title",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            sliderMenu: MenuWidget(
              onItemClick: (title) async {
                _key.currentState.closeDrawer();
                // setState(() {
                //   this.title = title;
                // });
                dispatch(GuideActionCreator.onClick());

              },
            ),
            // sliderMain: MainWidget(state, dispatch, viewService)),
            sliderMain: _itemWidget(state, viewService)),
      ),
    ),
  );
}

Widget _itemWidget(GuideState state, ViewService viewService) {
  if (state.items != null) {
    ///使用列表
    return ListView.builder(
      itemBuilder: viewService.buildAdapter().itemBuilder,
      itemCount: viewService.buildAdapter().itemCount,
    );
  } else {
    return Center(
      child: LinearProgressIndicator(),
    );
  }
}

class MainWidget extends StatefulWidget {

  GuideState state;
  Dispatch dispatch;
  ViewService viewService;

  MainWidget(GuideState state, Dispatch dispatch, ViewService viewService);

  @override
  _MainWidgetState createState() {
    return _MainWidgetState(state, viewService, dispatch);
  }


}

class _MainWidgetState extends State<MainWidget> {
  List<Data> dataList = [];
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  APIProvider apiProvider = APIProvider();
  GuideState state;
  Dispatch dispatch;
  ViewService viewService;

  _MainWidgetState(GuideState state, ViewService viewService, Dispatch dispatch);


  @override
  void initState() {
    super.initState();

    //mock
    dataList.add(Data(Colors.amber, 'Amelia Brown',
        'Life would be a great deal easier if dead things had the decency to remain dead.'));

    // apiProvider.getSearchAdvice("good").then((value) {
    //   var advice = value;
    //   var list = advice.slips;
    //   dataList.clear();
    //
    //   setState(() {
    //     list.forEach((e) {
    //       dataList.add(Data(Colors.green, e.advice, e.id.toString()));
    //       print("$dataList");
    //     });
    //   });
    // });
  }

  void _onRefresh() async{
    // monitor network fetch
    await apiProvider.getSearchAdvice("c").then((value) {
      var advice = value;
      var list = advice.slips;
      dataList.clear();

      setState(() {
        list.forEach((e) {
          dataList.add(Data(Colors.green, e.advice, e.id.toString()));
        });
      });
    });
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    // await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    apiProvider.getSearchAdvice("d").then((value) {
      var advice = value;
      var list = advice.slips;
      dataList.clear();

      setState(() {
        list.forEach((e) {
          dataList.add(Data(Colors.green, e.advice, e.id.toString()));
        });
      });
    });
    // if(mounted)
    //   setState(() {
    //
    //   });
    _refreshController.loadComplete();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: ClassicHeader(),
        footer: CustomFooter(
          builder: (BuildContext context,LoadStatus mode){
            Widget body ;
            if(mode==LoadStatus.idle){
              body =  Text("pull up load");
            }
            else if(mode==LoadStatus.loading){
              body =  CupertinoActivityIndicator();
            }
            else if(mode == LoadStatus.failed){
              body = Text("Load Failed!Click retry!");
            }
            else if(mode == LoadStatus.canLoading){
              body = Text("release to load more");
            }
            else{
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child:body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          // itemBuilder: (c, i) => Card(child: Center(child: Text(dataList[i].name))),
          itemBuilder: viewService.buildAdapter().itemBuilder,
          itemCount: viewService.buildAdapter().itemCount,
        ),
      ),
    );

  }
}

class Data {
  MaterialColor color;
  String name;
  String detail;

  Data(this.color, this.name, this.detail);
}


class MenuWidget extends StatelessWidget {
  final Function(String) onItemClick;

  const MenuWidget({Key key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            radius: 65,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: 60,
              // backgroundImage: AssetImage('assets/images/user_profile.jpg'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Nick',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'BalsamiqSans'),
          ),
          SizedBox(
            height: 20,
          ),
          sliderItem('Home', Icons.home),
          sliderItem('Add Post', Icons.add_circle),
          sliderItem('Notification', Icons.notifications_active),
          sliderItem('Likes', Icons.favorite),
          sliderItem('Setting', Icons.settings),
          sliderItem('LogOut', Icons.arrow_back_ios)
        ],
      ),
    );
  }

  Widget sliderItem(String title, IconData icons) => ListTile(
      title: Text(
        title,
        style:
        TextStyle(color: Colors.black, fontFamily: 'BalsamiqSans_Regular'),
      ),
      leading: Icon(
        icons,
        color: Colors.black,
      ),
      onTap: () {
        onItemClick(title);
      });
}