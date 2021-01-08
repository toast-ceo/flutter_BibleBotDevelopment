# :blue_book: Flutter - Provider


<br>


### :clipboard: Provider package를 쓰는 이유 & 장점


#### :pushpin: 관심사의 분리(Sparation of coneerns)[BloC패턴]

보통 관심사는 어떤 코드가 수행하는 일을 의미한다.
한개의 클래스가 여러 역할을 수행하면 할수록, 커지고 관리가 어렵게 된다.
그렇기에 클래스가 하나의 역할(관심)만 갖도록 클래스를 나눈다.

#### :pushpin: 데이터 공유의 원활함

하나의 데이터를 여러 페이지에서 공유를 간편하게 할 수 있다. (하위 위젯이 상위 위젯의 정보를 쓸 수 있게 됨)

#### :pushpin: 간결한 코드

provider 패턴을 사용하면 좀 더 적은 코드로 클래스를 구분하여 사용할 수 있다.

<hr>

### :clipboard: Provider 생산 / 소비

#### :pushpin: 생산

```dart
Provider<int>.value(value: 5, child: Container(),)
```
#### :pushpin: 소비

```dart
변수형 data = Provider.of<변수형>(context)
```

<hr>

### :clipboard: ChangeNotifierProvider

- UI의 값이 변경되었을 때, setState함수를 이용하여 페이지를 재로드한다. 하지만 Provider에서는 ChangeNotifier를 사용하여 같은 일을 수행할 수 있다.

#### :pushpin: 생산

```dart
ChangeNotifierProvider(create: (context) => className(),),


class ClassName with ChangeNotifier {
 	void Name (){
	    notifyListeners(); // 핵심 문장
 }	
}
```

<hr>

### BloC 패턴
- UI 에서는 StatefulWidget 을 쓰지 않고, 그리고 setState 를 쓰지 않고도 bloc 의 상태 변경에 따라 UI 를 변경할 수 있다. (재생산을 할 수 있다.) 
-> 역할 별로 나누는데 좋음 / 코드 자체가 복잡해지는 경향 


#### BLoC 의 특징
- UI와 데이터 처리 로직 분리가 됨
- UI 에서는 여러 BLoC 이 존재할 수 있다.
- UI 에서는 화면에 집중하고, BLoC 에서는 Logic 에 집중한다.
- UI 에서는 BLoC 의 내부 구현에 대해서 몰라도 된다.
- BLoC 은 여러 UI 에서 구독 할 수 있다. 때문에 재사용이 용의하다.
- BLoC 만을 분리해서 테스트가 가능하다.

<hr>

