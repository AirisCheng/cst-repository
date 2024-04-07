//index.ets
@Entry
@Component
struct ListExample {
  @State inSetValueOne: number = 4100
  @State inSetValueTwo: number = 500
  build() {
    Column() {
      Text('Setting Page')
        .width('100%')
        .height(100)
        .fontWeight(FontWeight.Bold)
        .fontSize(40)
        .textAlign(TextAlign.Center)

      List({ space: 15, initialIndex: 0 }) {
        //door
        ListItem() {
          Flex({direction: FlexDirection.Row, alignItems: ItemAlign.Center}){
              Image($r('app.media.door'))
                .width(70)
                .height(70)
                .margin(15)

              Text('Door Switch')
                .fontSize(22)
                .fontWeight(FontWeight.Bold)
                .textAlign(TextAlign.Start)
                .width('50%')

              Toggle({ type: ToggleType.Switch, isOn: false })
                .selectedColor('#007DFF')
                .switchPointColor('#FFFFFF')
                .onChange((isOn: boolean) => {
                  console.info('Component status:' + isOn)
                })
          }
          .borderRadius(10)
          .backgroundColor(0xFFFFFF)
        }

        //light
        ListItem() {
          Row(){
            Image($r('app.media.light'))
              .width(70)
              .height(70)
              .margin(15)

            Flex({direction: FlexDirection.Column, alignItems: ItemAlign.Start}){
              Row(){
                Text('Light Switch')
                  .fontSize(22)
                  .fontWeight(FontWeight.Bold)
                  .textAlign(TextAlign.Start)
                  .width('50%')
                Toggle({ type: ToggleType.Switch, isOn: false })
                  .selectedColor('#007DFF')
                  .switchPointColor('#FFFFFF')
                  .onChange((isOn: boolean) => {
                    console.info('Component status:' + isOn)
                  })
              }

              Text('Light Color')
                .fontSize(22)
                .fontWeight(FontWeight.Bold)
                .textAlign(TextAlign.Start)
                .width('80%')
              Row() {
                Slider({
                  value: this.inSetValueOne,
                  min: 2700,
                  max: 6000,
                  style: SliderStyle.InSet
                })
                  .width('55%')
                  .blockColor('#FFFFFF')
                  .trackColor('#AFD5FE')
                  .selectedColor('#FFC1B1')
                  .showTips(true)
                  .onChange((value: number, mode: SliderChangeMode) => {
                    this.inSetValueOne = value
                    console.info('value:' + value + 'mode:' + mode.toString())
                  })
                Text(this.inSetValueOne.toFixed(0)).fontSize(14).margin(2)
              }

              Text('Light Intensity')
                .fontSize(22)
                .fontWeight(FontWeight.Bold)
                .textAlign(TextAlign.Start)
                .width('80%')
              Row() {
                Slider({
                  value: this.inSetValueTwo,
                  min: 150,
                  max: 1000,
                  style: SliderStyle.InSet
                })
                  .width('55%')
                  .blockColor('#FFFFFF')
                  .trackColor('#DCDCDC')
                  .selectedColor('#007DFF')
                  .showTips(true)
                  .onChange((value: number, mode: SliderChangeMode) => {
                    this.inSetValueTwo = value
                    console.info('value:' + value + 'mode:' + mode.toString())
                  })
                Text(this.inSetValueTwo.toFixed(0)).fontSize(14).margin(5)
              }
            }
          }
          .borderRadius(10)
          .backgroundColor(0xFFFFFF)
        }

        //window
        ListItem() {
          Flex({direction: FlexDirection.Row, alignItems: ItemAlign.Center}){
            Image($r('app.media.window'))
              .width(70)
              .height(70)
              .margin(15)

            Text('Window Switch')
              .fontSize(22)
              .fontWeight(FontWeight.Bold)
              .textAlign(TextAlign.Start)
              .width('50%')

            Toggle({ type: ToggleType.Switch, isOn: false })
              .selectedColor('#007DFF')
              .switchPointColor('#FFFFFF')
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
              })
          }
          .borderRadius(10)
          .backgroundColor(0xFFFFFF)
        }

        //curtain
        ListItem() {
          Flex({direction: FlexDirection.Row, alignItems: ItemAlign.Center}){
            Image($r('app.media.curtain'))
              .width(70)
              .height(70)
              .margin(15)

            Text('Curtain Switch')
              .fontSize(22)
              .fontWeight(FontWeight.Bold)
              .textAlign(TextAlign.Start)
              .width('50%')

            Toggle({ type: ToggleType.Switch, isOn: false })
              .selectedColor('#007DFF')
              .switchPointColor('#FFFFFF')
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
              })
          }
          .borderRadius(10)
          .backgroundColor(0xFFFFFF)
        }

      }
      .listDirection(Axis.Vertical) // 排列方向
      .edgeEffect(EdgeEffect.Spring) // 滑动到边缘无效果
      .onScrollIndex((firstIndex: number, lastIndex: number) => {
        console.info('first' + firstIndex)
        console.info('last' + lastIndex)
      })
      .width('90%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}
