import promptAction from '@ohos.promptAction';

@Component
export struct UserPage {
  @State currentPage: string = 'electricity';
  @State username: string = '502C';
  @State electricityCost: string = '32.13元';
  @State temperature: string = '35度';

  @State BOnSt: promptAction.ShowToastOptions = {'message': 'Bluetooth is on.'};
  @State BOffSt: promptAction.ShowToastOptions = {'message': 'Bluetooth is off.'};

  build() {
    Column() {
      // 用户名和头像行
      Row() {
        Image($r('app.media.default_icon'))
          .width(90)
          .height(90);
        Text(this.username)
          .flexGrow(1)
          .textAlign(TextAlign.Center)
          .fontSize(30)  // 设置字体大小为20
          .fontFamily('宋体')  // 设置字体为宋体
          .padding({left: 10})
          .fontWeight(FontWeight.Bold);  // 加粗字体
      }

      // 添加粉线
      Row()
        .height(30)
        .backgroundColor(0xFFE0F5);

      // 电费统计行
      NavRouter() {
        Text("电费统计")
          .height(100)
          .width('80%')
          .padding({left: 10})
          .fontSize(26)
          .fontFamily('宋体')  // 设置字体为宋体
          .textAlign(TextAlign.Start)
          .backgroundColor(this.currentPage === 'electricity' ? 0xB3E5FC : 0xC9FFA2)
          .onClick(() => {
            this.currentPage = 'electricity';
          });
        NavDestination() {
          Text(this.electricityCost).width('20%').textAlign(TextAlign.End);
        }
        .title("电费统计")
      }

      // 添加粉线
      Row()
        .height(20)
        .backgroundColor(0xFFE0F5);

      // 使用情况行
      NavRouter() {
        Text("使用情况")
          .height(100)
          .width('80%')
          .padding({left: 10})
          .fontSize(26)
          .textAlign(TextAlign.Start)
          .fontFamily('宋体')  // 设置字体为宋体
          .backgroundColor(this.currentPage === 'usage' ? 0xB3E5FC :0xC9FFA2)
          .onClick(() => {
            this.currentPage = 'usage';
          });
        NavDestination() {
          Text(this.temperature).width('20%').textAlign(TextAlign.End);
        }
        .title("使用情况")
      }

      // 添加粉线
      Row()
        .height(20)
        .backgroundColor(0xFFE0F5);

      NavRouter() {
        Text("小屋日志")
          .height(100)
          .width('80%')
          .padding({left: 10})
          .fontSize(26)
          .textAlign(TextAlign.Start)
          .fontFamily('宋体')  // 设置字体为宋体
          .backgroundColor(this.currentPage === 'log' ? 0xB3E5FC : 0xC9FFA2)
          .onClick(() => {
            this.currentPage = 'log';
          });
        NavDestination() {
          Text("4人").width('20%').textAlign(TextAlign.End);
        }
        .title("小屋日志")
      }

      // 添加粉线
      Row()
        .height(30)
        .backgroundColor(0xFFE0F5);
      NavRouter() {
        Text("设置")
          .height(100)
          .width('80%')
          .padding({left: 10})
          .fontSize(26)
          .textAlign(TextAlign.Start)
          .fontFamily('宋体')  // 设置字体为宋体
          .backgroundColor(this.currentPage === 'settings' ? 0xB3E5FC : 0xC9FFA2)
          .onClick(() => {
            this.currentPage = 'settings';
          });
        NavDestination() {
          Text("更多").width('20%').textAlign(TextAlign.End);
        }
        .title("设置")
      }
      Row()
        .height(50)
        .backgroundColor(0xFFE0F5);
      // 底部圆圈
      Row() {
        Image($r('app.media.dec_1')).width(100).height(70).padding({ right: 30 });
        Image($r('app.media.dec_2')).width(110).height(70).padding({ left: 20, right: 20 });
        Image($r('app.media.dec_3')).width(100).height(70).padding({ left: 30 });
      }
      .justifyContent(FlexAlign.SpaceAround)
    }
    .backgroundColor(0xFFE0F5) // 设置为浅蓝色背景
    .padding(20)
    .width('100%')
    .height('100%')
  }
}