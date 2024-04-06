@Component
struct stateMenu {
  @State avatar: string = 'images/avatar.png'
  @State isUser: boolean = false
  @State isSleep: boolean = false
  @State isHome: boolean = false
  @State isOut: boolean = false

  build() {
    Column() {
      Image(this.avatar).height(50).width(50).margin(30)
      Row() {
        if(this.isSleep) Image('images/sleep_state.png').width(30).height(30) .objectFit(ImageFit.Contain)
        else Image('images/sleep_state_n.png').width(30).height(30) .objectFit(ImageFit.Contain)
        if(this.isHome) Image('images/home_state.png').width(30).height(30).objectFit(ImageFit.Contain)
        else Image('images/home_state_n.png').width(30).height(30).objectFit(ImageFit.Contain)
        if(this.isOut) Image('images/out_state.png').width(40).height(40).objectFit(ImageFit.Contain)
        else Image('images/out_state_n.png').width(40).height(40).objectFit(ImageFit.Contain)
      }.width('100%').justifyContent(FlexAlign.SpaceAround)
      if(this.isUser == true) {
        Row() {
          Toggle({ type: ToggleType.Switch, isOn: false })
            .onChange((isOn:boolean)=>{
            if(isOn) this.isSleep = true
          })
            .selectedColor(Color.Pink)
          Toggle({ type: ToggleType.Switch, isOn: false })
            .onChange((isOn:boolean)=>{
              if(isOn) this.isHome = true
            })
            .selectedColor(Color.Pink)
            .onChange((isOn:boolean)=>{
              if(isOn) this.isOut = true
            })
          Toggle({ type: ToggleType.Switch, isOn: false })
            .selectedColor(Color.Pink)
        }
      }
    }.width('100%')
  }
}


@Component
struct MainMenu {
  build() {
    Row() {
      Button() {
        Image('images/home.png')
          .onClick((event: ClickEvent) => {})
      }.width(50).height('90%').margin(10)

      Button() {
        Image('images/control.png').objectFit(ImageFit.Contain)
          .onClick((event: ClickEvent) => {})
      }.width(50).height('80%').margin(10).backgroundColor(0x1585FF)

      Button() {
        Image('images/person.png').objectFit(ImageFit.Contain)
          .onClick((event: ClickEvent) => {})
      }.width(50).height('80%').margin(10)

    }.width('100%').height(50).backgroundColor(0x1585FF).justifyContent(FlexAlign.SpaceBetween)
  }
}

@Entry
@Component
struct Index {
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
          Image('images/sun.png')
            .width(this.imageHeight)
            .height(this.imageHeight)
        }.width('33%')
        Column() {
          Text(`${this.humidity}` + '%')
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
          Image('images/water.png')
            .width(this.imageHeight)
            .height(this.imageHeight)
        }.width('33%')

        Column() {
          Text(`${this.API}`)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
          Image('images/smog.png')
            .width(this.imageHeight)
            .height(this.imageHeight)
            .objectFit(ImageFit.Contain)
        }.width('33%')
      }.height('20%').backgroundColor(0xD5FBFF).justifyContent(FlexAlign.SpaceEvenly)

      Divider()

      Flex({ wrap: FlexWrap.Wrap }) {
        Column() {
          stateMenu({ isUser: true, isSleep: true })
        }.width('50%').height(this.stateHeight).backgroundColor(0xFF8993)
        Column() {
          stateMenu({ isHome: true })
        }.width('50%').height(this.stateHeight).backgroundColor(0xEEE7DA)
        Column() {
          stateMenu({ isOut: true })
        }.width('50%').height(this.stateHeight).backgroundColor(0xEEE7DA)
        Column() {
          stateMenu()
        }.width('50%').height(this.stateHeight).backgroundColor(0xFF8993)
      }.height('70%')
      .width('100%')
      .padding(10)
      .backgroundColor(0xAFEEEE)

      Divider()

      MainMenu().height('10%')
    }.height('100%').backgroundColor(0xC4EEFF)


  }
}