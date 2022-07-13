import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/provider/providerManager.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/shared/constant.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/widgets/data_list_card.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProviderManager>(context, listen: false).getData(context);
    });

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Provider.of<ProviderManager>(context, listen: false)
              .getMoreData(context);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    var width = mediaQueryData.size.width;

    return Scaffold(
      appBar: AppBar(
        title: textPoppins('Third Screen', 18, darkColor, FontWeight.w600),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.5),
          child: Container(
            color: secondaryColor,
            height: 0.5,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: blueColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Provider.of<ProviderManager>(context, listen: false)
              .getMoreData(context);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<ProviderManager>(
                builder: (context, value, child) {
                  if (value.dataState == DataState.loading) {
                    return const Center(
                      child: RefreshProgressIndicator(),
                    );
                  }

                  if (value.dataState == DataState.error) {
                    return const Center(
                      child: Text('Something went wrong'),
                    );
                  }

                  if (value.allDataList.isEmpty) {
                    return const Center(
                      child: Text('Nothing here, refresh page please!'),
                    );
                  }

                  return SizedBox(
                    height: !value.nextPage ? height : 500,
                    child: ListView.separated(
                      padding: const EdgeInsets.all(20.0),
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        if (index == value.allDataList.length) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Opacity(
                                opacity: Provider.of<ProviderManager>(context,
                                            listen: false)
                                        .isLoading
                                    ? 1.0
                                    : 00,
                                child: const CircularProgressIndicator(),
                              ),
                            ),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {},
                            child: DataListCard(
                              url: value.allDataList[index].avatar!,
                              firstName: value.allDataList[index].firstName!,
                              lastName: value.allDataList[index].lastName!,
                              email: value.allDataList[index].email!,
                            ),
                          );
                        }
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          thickness: 0.5,
                          color: secondaryColor,
                        );
                      },
                      itemCount: value.allDataList.length,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
