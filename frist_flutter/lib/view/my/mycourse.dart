import 'package:FlutterDemo/model/course/coursemodel.dart';
import 'package:FlutterDemo/view/course/categorydetail.dart';
import 'package:FlutterDemo/view/course/coursedetail.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sfviewtool/sfviewtool.dart';

class MyCoursePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyCoursePage();
  }
}

class _MyCoursePage extends State<MyCoursePage> {
  @override
  Widget build(BuildContext context) {
    CourseModel model = CourseModel();
    model.courseTitle = "大数据 flutter学习";
    model.imageUrl =
        "https://img-blog.csdnimg.cn/20190902174921871.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01yc19jaGVucw==,size_16,color_FFFFFF,t_70";
    model.courseDesc = "内容";
    List<CourseModel> models = List();
    models.add(model);
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerScrolled) => <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    child: SliverAppBar(
                      title: Text("我的课程"),
                      expandedHeight: 400,
                      pinned: true,
                      actions: <Widget>[
                        IconButton(icon: Icon(Icons.call_to_action),onPressed: (){
                          Navigator.pushNamed(context, "CourseCalendar");

                        },)
                      ],
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack()
                            .addSubWight(
                                getLearnChart().putIntoContainer(
                                    height: 340, color: Colors.grey),
                                top: 0,
                                right: 0,
                                left: 0)
                            .addSubWight(getLearnSumary(),
                                bottom: 0, right: 0, left: 0)
                            .putIntoContainer(height: 400),
                      ),
                    ),
                  )
                ],
            body: CustomScrollView(
              // key: PageStorageKey("home"),
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Text(
                    "最近观看",
                    style: TextStyle(fontSize: 18),
                  ).putIntoContainer(
                      width: double.infinity,
                      height: 30,
                      margin: EdgeInsets.only(left: 10)),
                ),
                getList(models),
                SliverToBoxAdapter(
                  // child: getList("精选课程",models),
                  child: Text(
                    "所有课程",
                    style: TextStyle(fontSize: 18),
                  ).putIntoContainer(
                      width: double.infinity,
                      height: 30,
                      margin: EdgeInsets.only(left: 10)),
                ),
                getList(models),
              ],
            )));

    // TODO: implement build
    return CustomScrollView(
      // key: PageStorageKey("home"),
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Stack()
              .addSubWight(
                  getLearnChart()
                      .putIntoContainer(height: 340, color: Colors.grey),
                  top: 0,
                  right: 0,
                  left: 0)
              .addSubWight(getLearnSumary(), bottom: 0, right: 0, left: 0)
              .putIntoContainer(height: 400),
        ),
        SliverToBoxAdapter(
          // child: getList("精选课程",models),
          child: Text(
            "最近观看",
            style: TextStyle(fontSize: 18),
          ).putIntoContainer(
              width: double.infinity,
              height: 30,
              margin: EdgeInsets.only(left: 10)),
        ),
        getList(models),
        SliverToBoxAdapter(
          // child: getList("精选课程",models),
          child: Text(
            "所有课程",
            style: TextStyle(fontSize: 18),
          ).putIntoContainer(
              width: double.infinity,
              height: 30,
              margin: EdgeInsets.only(left: 10)),
        ),
        getList(models),
      ],
    );
  }

  Widget getCategoryItem(String title, String imageName) {
    return Column()
        .addSubWight(Image(
          image: AssetImage("assets/images/" + imageName + ".png"),
          width: 50,
          height: 50,
        ).putIntoContainer())
        .addSubWight(Container(
          height: 5,
          width: double.infinity,
        ))
        .addSubWight(Text(
          title,
          style: TextStyle(fontSize: 13),
        ))
        .putIntoContainer(width: 50, height: 80);
  }

  Widget getList(List<CourseModel> models) {
    return SliverFixedExtentList(
        itemExtent: 80,
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return CourseListItemView(models[0])
              .putIntoGestureDetector(GestureDetector(onTapDown: (event) {
            // log("点击第$index");
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CourseDetailPage();
            }));
          }));
        }, childCount: 3));
  }

  Widget getLearnChart() {
    return LineChart(sampleData1()).putIntoContainer(height: 100,);
  }

  LineChartData sampleData1() {
    return LineChartData(
      
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {
          print(touchResponse);
        },
        handleBuiltInTouches: true,
      ),
      gridData: const FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: TextStyle(
            color: const Color(0xff72719b),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'SEPT';
              case 7:
                return 'OCT';
              case 12:
                return 'DEC';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: const Color(0xff75729e),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1m';
              case 2:
                return '2m';
              case 3:
                return '3m';
              case 4:
                return '5m';
            }
            return '';
          },
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(
            color: const Color(0xff4e4965),
            width: 4,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: 14,
      maxY: 4,
      minY: 0,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    LineChartBarData lineChartBarData1 = const LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 1.5),
        FlSpot(5, 1.4),
        FlSpot(7, 3.4),
        FlSpot(10, 2),
        FlSpot(12, 2.2),
        FlSpot(13, 1.8),
      ],
      isCurved: true,
      colors: [
        Color(0xff4af699),
      ],
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );

    return [
      lineChartBarData1,
    ];
  }

  Widget getLearnSumary() {
    return Card(
        child: Flex(
      direction: Axis.horizontal,
    )
            .addSubWight(getLearnSumaryItem('今日学习', 0, '分钟'), flex: 1)
            .addSubWight(Container(
              width: 1,
              height: 20,
            ))
            .addSubWight(getLearnSumaryItem('连续学习', 3, '天'), flex: 1)
            .addSubWight(Container(
              color: Colors.white,
              width: 1,
              height: 20,
            ))
            .addSubWight(getLearnSumaryItem('累计学习', 20, '小时'), flex: 1)).putIntoContainer(
              color: Colors.white,
              padding: EdgeInsets.all(10)
            );
  }

  Widget getLearnSumaryItem(String title, double time, String timeUnitString) {
    return Stack()
        .addSubWight(
          Text(title).putIntoContainer(height: 30),
          top: 15,
          left: 30,
        )
        .addSubWight(
          Text.rich(TextSpan(children: <TextSpan>[
            TextSpan(text: time.toString(), style: TextStyle(fontSize: 20)),
            TextSpan(text: timeUnitString)
          ])).putIntoContainer(height: 30),
          top: 45,
          left: 30,
        )
        .putIntoContainer(height: 90);
  }
}
