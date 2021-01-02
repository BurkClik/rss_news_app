import 'package:flutter/material.dart';
import 'package:multicamp_news_app/theme/constants.dart';
import 'package:multicamp_news_app/theme/size_config.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeBody extends StatefulWidget {
  HomeBody() : super();

  final String title = 'Haberler';

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  static const String rss_url = "https://t24.com.tr/rss";
  RssFeed _feed;
  String _title;
  GlobalKey<RefreshIndicatorState> _refreshKey;

  final TextEditingController searchController = TextEditingController();

  updateTitle(title) {
    setState(() {
      _title = title;
    });
  }

  updateFeed(feed) {
    setState(() {
      _feed = feed;
    });
  }

  Future<void> openFeed(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: true);
      return;
    }
    updateTitle('Bir hata oluştu');
  }

  load() async {
    updateTitle('Yükleniyor...');
    loadFeed().then((result) {
      if (result == null || result.toString().isEmpty) {
        updateTitle('Hata');
        return;
      }
      updateFeed(result);
      updateTitle(_feed.title);
    });
  }

  Future<RssFeed> loadFeed() async {
    try {
      final client = http.Client();
      final response = await client.get(rss_url);
      return RssFeed.parse(response.body);
    } catch (e) {}
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshKey = GlobalKey<RefreshIndicatorState>();
    updateTitle(widget.title);
    load();
  }

  isFeedEmpty() {
    return _feed == null || _feed.items == null;
  }

  @override
  Widget build(BuildContext context) {
    return isFeedEmpty()
        ? Center(child: CircularProgressIndicator())
        : RefreshIndicator(
            key: _refreshKey,
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      width: getProportionateScreenWidth(304),
                      height: getProportionateScreenHeight(48),
                      child: TextFormField(
                        autocorrect: false,
                        controller: searchController,
                        decoration: kSearchInputDeco,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _feed.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = _feed.items[index];
                      return Padding(
                        padding:
                            EdgeInsets.only(left: 12.0, right: 12.0, top: 16.0),
                        child: InkWell(
                          onTap: () {
                            openFeed(item.link);
                          },
                          child: Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              Container(
                                width: double.infinity,
                                height: getProportionateScreenHeight(200),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        item.enclosure.url),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: getProportionateScreenHeight(200),
                                decoration: kNewsFilter,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  item.title,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: kNewsTitle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            onRefresh: () => load(),
          );
  }
}
