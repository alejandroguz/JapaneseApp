//
//  ContentView.swift
//  JapaneseApp
//
//  Created by Alejandro Guzman Bolivar on 8/3/23.
//

import ComposableArchitecture
import SwiftUI

struct ContentView: View {
  @State var selection = TabButton(image: "N4samurai", text: "N4")

  var body: some View {
    CustomTabBarContainerView(selection: $selection) {
      Color.green
        .tabBarItem(tab: TabButton(image: "N5samurai", text: "N5"),
                    selection: $selection)

      Color.red
        .tabBarItem(tab: TabButton(image: "N4samurai", text: "N4"),
                    selection: $selection)

      Color.yellow
        .tabBarItem(tab: TabButton(image: "N3samurai", text: "N3"),
                    selection: $selection)

      Color.orange
        .tabBarItem(tab: TabButton(image: "N2samurai", text: "N2"),
                    selection: $selection)

      Color.cyan
        .tabBarItem(tab: TabButton(image: "N1samurai", text: "N1"),
                    selection: $selection)
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
