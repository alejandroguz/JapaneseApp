//
//  CustomTabBar.swift
//  JapaneseApp
//
//  Created by Alejandro Guzman Bolivar on 8/10/23.
//

import ComposableArchitecture
import SwiftUI

struct CustomTabBarView: View {
  let store: StoreOf<CustomTabBarFeature>

  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      VStack {
        ZStack {
          switch viewStore.selectedTab.text {
          case "N5":
            Text("N5")
          case "N4":
            Text("N4")
          case "N3":
            Text("N3")
          case "N2":
            Text("N2")
          case "N1":
            Text("N1")
          default:
            Text("Nothing Yet")
          }
        }

        ZStack {
          Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 100)
          HStack(spacing: 20) {
            ForEach(viewStore.tabs) { tab in
              VStack(alignment: .center) {
                Image(tab.image)
                  .resizable()
                  .frame(width: 50, height: 50)
                Text(tab.text)
                  .foregroundColor(.white)
                  .fontWeight(.bold)
              }
              .scaleEffect(viewStore.selectedTab.text == tab.text ? 1 : 0.8)
              .onTapGesture {
                viewStore.send(.tabTapped(tab))
                print(tab)
              }
            }
          }
        }
      }
    }
  }
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
    CustomTabBarView(store: Store(initialState: CustomTabBarFeature.State(),
                                  reducer: { CustomTabBarFeature()._printChanges() }))
  }
}
