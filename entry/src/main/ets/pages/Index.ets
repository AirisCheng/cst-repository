@Component
struct stateMenu {
  @State avatar: string = 'profile_images/default_icon.png'
  @State isUser: boolean = false
  @State isSleep: boolean = false
  @State isHome: boolean = false
  @State isOut: boolean = false
  icon_size: number = 35

  build() {
    Column() {
      Image(this.avatar).height(100).width(100).margin(10)
      Row() {
        Image(this.isSleep ? $r('app.media.sleep_state') : $r('app.media.sleep_state_n'))
          .width(this.icon_size).height(this.icon_size).objectFit(ImageFit.Contain)
        Image(this.isHome ? $r('app.media.home_state') : $r('app.media.home_state_n'))
          .width(this.icon_size).height(this.icon_size).objectFit(ImageFit.Contain)
        Image(this.isOut ? $r('app.media.out_state') : $r('app.media.out_state_n'))
          .width(this.icon_size+10).height(this.icon_size+10).objectFit(ImageFit.Contain)
      }.width('100%').justifyContent(FlexAlign.SpaceAround)
        if(this.isUser) {
          Row() {
            Toggle({ type: ToggleType.Switch, isOn: false })
              .onChange((isOn:boolean)=>{this.isSleep = isOn})
              .selectedColor(Color.Pink)

            Toggle({ type: ToggleType.Switch, isOn: false })
              .onChange((isOn:boolean)=>{this.isHome = isOn})
              .selectedColor(Color.Pink)

            Toggle({ type: ToggleType.Switch, isOn: false })
              .onChange((isOn:boolean)=> {this.isOut = isOn})
              .selectedColor(Color.Pink)
          }.width('100%').justifyContent(FlexAlign.SpaceAround)
        }
      }.width('100%')
    }
}

@Component
export struct HomePage{
  @State temperature: string = '25'
  @State humidity: string = '95'
  @State API: string = '47'
  imageHeight = 50
  stateHeight = 200

  build() {
    Column() {
      Row() {
        Column() {
          Text(`${this.temperature}` + '°')
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
          Image($r('app.media.sun'))
            .width(this.imageHeight)
            .height(this.imageHeight)
        }.width('33%')
        Column() {
          Text(`${this.humidity}` + '%')
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
          Image($r('app.media.water'))
            .width(this.imageHeight)
            .height(this.imageHeight)
        }.width('33%')

        Column() {
          Text(`${this.API}`)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
          Image($r('app.media.mask'))
            .width(this.imageHeight)
            .height(this.imageHeight)
            .objectFit(ImageFit.Contain)
        }.width('33%')
      }.height('20%').backgroundColor(0xA2CDE6).justifyContent(FlexAlign.SpaceEvenly)

      Divider()

      Flex({ wrap: FlexWrap.Wrap }) {
        Column() {
          stateMenu({ isUser: true })
        }.width('50%').height(this.stateHeight).backgroundColor(0xA2DFDB)
        Column() {
          stateMenu({ isHome: true })
        }.width('50%').height(this.stateHeight).backgroundColor(0xF7F4DB)
        Column() {
          stateMenu({ isOut: true })
        }.width('50%').height(this.stateHeight).backgroundColor(0xF7F4DB)
        Column() {
          stateMenu({ isSleep: true })
        }.width('50%').height(this.stateHeight).backgroundColor(0xA2DFDB)
      }
      .width('100%')
      .padding(10)

      Divider()
    }.height('100%').backgroundColor(0xD2EAF3)
  }
}