export interface NavigationItem {
  id: number;
  text: string; //文本
  icon_normal: Resource; // 默认图标
  icon_selected: Resource; // 选中图标
}

export const NavigationList: NavigationItem[] = [
  {
    icon_normal: $r('app.media.home'),
    icon_selected: $r('app.media.home_selected'),
    text: '寝室',
    id: 0
  },
  {
    icon_normal: $r('app.media.control'),
    icon_selected: $r('app.media.control_selected'),
    text: '控制',
    id: 1
  },
  {
    icon_normal: $r('app.media.user'),
    icon_selected: $r('app.media.user_selected'),
    text: '用户',
    id: 2
  },
]
