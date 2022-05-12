import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movielab/models/models.dart';
import 'package:movielab/pages/show/show_box/show_box_common.dart';

class BoxOfficeShowBox extends StatelessWidget {
  ShowPreview showPreview;
  BoxOfficeShowBox({Key? key, required this.showPreview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String id = showPreview.id;
    String rank = showPreview.rank;
    String image = showPreview.image;
    String title = showPreview.title;
    String year = showPreview.year;
    String weekend = showPreview.crew;
    String gross = showPreview.gross;
    String weeks = showPreview.weeks;
    final String worldwideLifetimeGross = showPreview.worldwideLifetimeGross;
    final String domesticLifetimeGross = showPreview.domesticLifetimeGross;
    final String domestic = showPreview.domestic;
    final String foreignLifetimeGross = showPreview.foreignLifetimeGross;
    final String foreign = showPreview.foreign;
    print(image);
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: InkWell(
          onTap: () async {
            openShowPage(context, id);
          },
          borderRadius: BorderRadius.circular(15),
          child: Container(
            margin: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            // height: 150,
            child: Row(
              children: [
                image != 'null'
                    ? SizedBox(
                        width: 100,
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7.5),
                          child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: image,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              placeholder: (context, url) => const Center(
                                    child: SpinKitThreeBounce(
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                  )),
                        ))
                    : Empty(),
                Container(
                  alignment: Alignment.bottomLeft,
                  width: image != null || image != 'null' || image != ''
                      ? MediaQuery.of(context).size.width - 140
                      : MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              "$rank. $title",
                              softWrap: true,
                              style: GoogleFonts.ubuntu(
                                  color: Colors.white,
                                  fontSize: 16.5,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      info(info: weekend, infoText: 'Weekend: $weekend'),
                      info(info: gross, infoText: 'Gross: $gross'),
                      info(info: weeks, infoText: 'Weeks: $weeks'),
                      info(
                          info: worldwideLifetimeGross,
                          infoText:
                              'Worldwide Lifetime Gross: $worldwideLifetimeGross'),
                      info(
                          info: domesticLifetimeGross,
                          infoText:
                              'Domestic Lifetime Gross: $domesticLifetimeGross'),
                      info(info: domestic, infoText: 'Domestic: $domestic'),
                      info(
                          info: foreignLifetimeGross,
                          infoText:
                              'Foreign Lifetime Gross: $foreignLifetimeGross'),
                      info(info: foreign, infoText: 'Foreign: $foreign'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget Empty() {
    return const SizedBox();
  }

  Widget info({required String info, required String infoText}) {
    return info != ''
        ? Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  infoText,
                  softWrap: true,
                  style: GoogleFonts.ubuntu(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          )
        : Empty();
  }
}
