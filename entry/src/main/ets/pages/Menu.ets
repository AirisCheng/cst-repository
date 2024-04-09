import { ControlPage } from './Control';
import { HomePage } from './Index';
import { NavigationItem, NavigationList } from './TabsInfo';
import { UserPage } from './User';
@Entry
@Component
struct MainPage {
  @State mCurrentPage: number = 0;
  private mTabController: TabsController = new TabsController()

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.mTabController }) {

      TabContent() {
        HomePage()
      }
      .tabBar(this.TabBuilder(NavigationList[0]))

      TabContent() {
       ControlPage()
      }
      .tabBar(this.TabBuilder(NavigationList[1]))

      TabContent() {
        UserPage()
      }
      .tabBar(this.TabBuilder(NavigationList[2]))

    }
    .scrollable(true)
    .vertical(false)
    .barMode(BarMode.Fixed)
    .backgroundColor(0xEEEF7FC)
    .onChange((index) => {
      this.mCurrentPage = index;
    })

  }

  @Builder TabBuilder(item: NavigationItem) {

    Column() {
      Image(this.mCurrentPage === item.id ? item.icon_selected : item.icon_normal)
        .width(30)
        .height(30)
        .objectFit(ImageFit.Contain)

      Text(item.text)
        .fontSize(15)
        .fontWeight(500)
        .fontColor(this.mCurrentPage === item.id ? '#3d9dff' : '#999999')
        .margin({ top: '5' })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
