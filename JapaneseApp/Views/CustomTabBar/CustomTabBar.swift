//
//  CustomTabBar.swift
//  JapaneseApp
//
//  Created by Alejandro Guzman Bolivar on 8/10/23.
//

import SwiftUI

struct CustomTabBarView: View {
  var tabItems: [TabButton]
  @Binding var selection: TabButton

  var body: some View {
    ZStack {
      Rectangle()
        .frame(maxWidth: .infinity)
        .frame(height: 100)
      HStack(spacing: 20) {
        ForEach(tabItems, id: \.image) { item in
          tabView(tab: item)
            .onTapGesture {
              self.selection = item
            }
        }
      }
    }
  }
}

struct TabButton: Hashable {
  let image: String
  let text: String
}

struct CustomTabBar_Previews: PreviewProvider {
  static let exampleTabs = [
    TabButton(image: "N5samurai", text: "N5"),
    TabButton(image: "N4samurai", text: "N4"),
    TabButton(image: "N3samurai", text: "N3"),
    TabButton(image: "N2samurai", text: "N2"),
    TabButton(image: "N1samurai", text: "N1")
  ]

  static var previews: some View {
    CustomTabBarView(tabItems: exampleTabs,
                     selection: .constant(TabButton(image: "N5samurai", text: "N5")))
  }
}

extension CustomTabBarView {
  private func tabView(tab: TabButton) -> some View {
    VStack(alignment: .center) {
      Image(tab.image)
        .resizable()
        .frame(width: 50, height: 50)
      Text(tab.text)
        .foregroundColor(selection == tab ? .white : .gray)
        .fontWeight(.bold)
    }
    .scaleEffect(1.0)
//    .scaleEffect(selection == tab ? 1.0 : 0.8)
  }
}
