# Flutter 팀프로젝트 Repo

## 1. 각 탭에 접근하는 방법

home_view.dart 내 생성자에서 index 0 ~ 3 설정을 통해 각 탭에 대한 위젯을 설정할 수 있음

``` dart
HomeView() {

        ... 중략 ...

    controller.changeIndex = (int index) {
      
        if (index == 0) {
          controller.homeViewAnimationController
              ?.reverse()
              .then<dynamic>((data) {
            controller.tabBody = FirstTabView();
            controller.update();
          });
        } else if(index  == 1) {
          controller.homeViewAnimationController
              ?.reverse()
              .then<dynamic>((data) {
            controller.tabBody = SecondTabView();
            controller.update();
          });
        } else if(index  == 2) {
          controller.homeViewAnimationController
              ?.reverse()
              .then<dynamic>((data) {
            controller.tabBody = ThirdTabView();
            controller.update();
          });
        } else if(index  == 3) {
          controller.homeViewAnimationController
              ?.reverse()
              .then<dynamic>((data) {
            controller.tabBody = ForthTabView();
            controller.update();
          });
        } 
        
    };

```

## 2. listViews 에 들어가는 위젯
Widget 리스트이기 때문에 아무 위젯이나 넣어도 되며, 아래의 예제 리스트를 확인 후 복사, 수정하여 사용

### 예제 위젯
- first/first_type_1_view.dart
- first/first_type_2_view.dart
- first/first_type_3_view.dart
- first/first_type_4_view.dart
- first/first_type_4_wave_view.dart
- first/first_type_5_view.dart

- second/second_type_1_view.dart
- second/second_type_2_view.dart
- second/second_type_3_view.dart