import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_boost_new/guide/guide_action.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'guide_state.dart';

Widget buildView(GuideState state, Dispatch dispatch, ViewService viewService) {
  return buildWidget(state, dispatch, viewService);
}

Widget buildWidget(
    GuideState state, Dispatch dispatch, ViewService viewService) {
  // GlobalKey<SliderMenuContainerState> _key =
  // new GlobalKey<SliderMenuContainerState>();
  GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();

  return CupertinoApp(
    debugShowCheckedModeBanner: false,
    home: Padding(
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
      child: Scaffold(
        body: SliderDrawer(
          key: _key,
          sliderOpenSize: 200,
          child: MainWidget(state, viewService, dispatch),
          slider: MenuWidget(
            onItemClick: (title, item) async {
              _key.currentState.closeSlider();
              // setState(() {
              //   this.title = title;
              // });
              dispatch(GuideActionCreator.menuClick(item));
            },
          ),
        )
      ),
    ),
  );
}


Widget _itemWidget(ViewService viewService, GuideState state) {
  if (state.items != null) {
    ///使用列表
    return Expanded(
      child: ListView.builder(
        itemBuilder: viewService.buildAdapter().itemBuilder,
        itemCount: viewService.buildAdapter().itemCount,
      ),
    );
    // return MainWidget(state, viewService);
  } else {
    return Center(
      child: LinearProgressIndicator(),
    );
  }
}

class MainWidget extends StatefulWidget {
  final GuideState state;
  final ViewService viewService;
  final Dispatch dispatch;
  MainWidget(this.state, this.viewService, this.dispatch);

  @override
  // ignore: missing_return
  _MainWidgetState createState() {
    return _MainWidgetState(state, viewService, dispatch);
  }
}

class _MainWidgetState extends State<MainWidget> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final GuideState state;
  final Dispatch dispatch;
  final ViewService vService;

  _MainWidgetState(this.state, this.vService, this.dispatch);

  @override
  void initState() {
    super.initState();
    //mock
  }

  void _onRefresh() async {
    // monitor network fetch
    // if failed,use refreshFailed()
    // await Future.delayed(Duration(milliseconds: 1000));

    dispatch(GuideActionCreator.refreshList());

    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (mounted) setState(() {});
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
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("release to load more");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        enableTwoLevel: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        //list item
        child: _itemWidget(),
      ),
    );
  }

  Widget _itemWidget() {
    if (state.items != null && vService.buildAdapter() != null) {
      ///使用列表
      return ListView.builder(
        itemBuilder: vService.buildAdapter().itemBuilder,
        itemCount: vService.buildAdapter().itemCount,
      );
      // return MainWidget(state, viewService);
    } else {
      return Center(
        child: LinearProgressIndicator(),
      );
    }
  }
}

class Data {
  MaterialColor color;
  String name;
  String detail;

  Data(this.color, this.name, this.detail);
}

enum MenuItemType {
    LogOut,
    Home
}

class MenuWidget extends StatelessWidget {
  final Function(String, MenuItemType) onItemClick;

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
          sliderItem('Home', Icons.home, MenuItemType.Home),
          sliderItem('Add Post', Icons.add_circle, MenuItemType.Home),
          sliderItem('Notification', Icons.notifications_active, MenuItemType.Home),
          sliderItem('Likes', Icons.favorite, MenuItemType.Home),
          sliderItem('Setting', Icons.settings, MenuItemType.Home),
          sliderItem('LogOut', Icons.arrow_back_ios, MenuItemType.LogOut)
        ],
      ),
    );
  }

  Widget sliderItem(String title, IconData icons, MenuItemType itemType) => ListTile(
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
        onItemClick(title, itemType);
      });
}
