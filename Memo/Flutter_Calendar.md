# :blue_book: Flutter - Table_Calendar(_buildTableCalendarWithBuilders)


<br>


### :clipboard: 달력 패키지

- 크게 달력 자체의 로직, 상태를 maker표시 해주는 로직, 버튼으로 이동 할 수 있는 로직, 받은 데이터를 ListView로 뿌려주는 로직이 있음



#### :pushpin: 달력 builder부분

```dart
 builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
// 오늘과 겹치는 날(일)
          return FadeTransition( 
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: HexColor("#D0C3A3"),
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(
                  fontSize: 14.0,
                  fontFamily: 'NanumMyeongjo',
                ),
              ),
            ),
          );
        },
//오늘의 날의 날짜(일)
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
            color: HexColor("#E8E6D1"),
            width: 100,
            height: 100,
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(
                fontSize: 14.0,
                fontFamily: 'NanumMyeongjo',
              ),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];
          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }
          return children;
        },
      ),
      onDaySelected: (date, events, holidays) {
        _onDaySelected(date, events, holidays);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
```

<hr>

#### :pushpin: 달력 Decoration 부분

```dart
      locale: 'en_Us', // 달력 안에 언어  
      calendarController: _calendarController,
      events: _events,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide, //달력 넘김 방식
      startingDayOfWeek: StartingDayOfWeek.sunday, //요일 시작 설정
      availableGestures: AvailableGestures.all, 
      availableCalendarFormats: const { // 달력이 보여지는 형태 - 달, 2주씩, 일주일씩
        CalendarFormat.month: '',
        //CalendarFormat.week: '',
      },
// 달력의 숫자 을 가르키는 부분
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        outsideWeekendStyle: TextStyle()
            .copyWith(color: HexColor("#4F8FA8"), fontFamily: "NanumMyeongjo"),
        weekdayStyle: TextStyle().copyWith(fontFamily: "NanumMyeongjo"), //달력 숫자
        weekendStyle: TextStyle().copyWith(
            color: HexColor("#4F8FA8"), fontFamily: "NanumMyeongjo"), //휴일 숫자 색
      ),
// 달력의 일을 가르키는 부분
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle().copyWith(fontFamily: "NanumMyeongjo"),
        weekendStyle: TextStyle()
            .copyWith(color: HexColor("#4F8FA8"), fontFamily: "NanumMyeongjo"),
      ),
// 달력의 월 을 가르키는 부분
      headerStyle: HeaderStyle( 
        centerHeaderTitle: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle().copyWith(fontFamily: "NanumMyeongjo"),
      ),
```

<hr>

#### :pushpin: Calendar에 Event가 생겼을 때, Maker

```dart
Widget _buildEventsMarker(DateTime date, List events) // DateTime 변수 (년월일로만 받음)랑 String 형의 List를 받음
{
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? HexColor("#6F825A")
            : _calendarController.isToday(date)
                ? HexColor("#A6CBD4") //선택 x
                : HexColor("#4F8FA8"), //지난날의 정보
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
            fontFamily: 'NanumMyeongjo',
          ),
        ),
      ),
    );
  }
```

<hr>

