//
//  CustomTabBarContainerView.swift
//  JapaneseApp
//
//  Created by Alejandro Guzman Bolivar on 8/14/23.
//

import SwiftUI

struct CustomTabBarContainerView<Content:View>: View {
  @Binding var selection: TabButton
  let content: Content
  @State private var tabss: [TabButton] = []

  init(selection: Binding<TabButton>, @ViewBuilder content: () -> Content) {
    self._selection = selection
    self.content = content()
  }

  var body: some View {
    VStack(spacing: 0) {
        ZStack {
          content
        }
      CustomTabBarView(tabItems: tabss, selection: $selection)
    }
    .ignoresSafeArea()
    .onPreferenceChange(TabItemPreferenceKey.self) { item in
      self.tabss = item
    }
  }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
  static let exampleTabs = [
    TabButton(image: "N5samurai", text: "N5"),
    TabButton(image: "N4samurai", text: "N4"),
    TabButton(image: "N3samurai", text: "N3"),
    TabButton(image: "N2samurai", text: "N2"),
    TabButton(image: "N1samurai", text: "N1")
  ]


  static var previews: some View {
    CustomTabBarContainerView(selection: .constant(exampleTabs.first!)) {
      Color.orange
        .tabBarItem(tab: exampleTabs[0])
      Color.green
        .tabBarItem(tab: exampleTabs[1])
      Color.blue
        .tabBarItem(tab: exampleTabs[3])
      Color.red
        .tabBarItem(tab: exampleTabs[2])
    }
  }
}
