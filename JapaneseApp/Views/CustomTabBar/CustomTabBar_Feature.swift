//
//  CustomTabBarContainerView.swift
//  JapaneseApp
//
//  Created by Alejandro Guzman Bolivar on 8/14/23.
//

import ComposableArchitecture
import SwiftUI

struct CustomTabBarFeature: Reducer {
  struct State: Equatable {
    var selectedTab = TabButton(image: "N5samurai", text: "N5")
    var tabs: [TabButton] = [
      TabButton(image: "N5samurai", text: "N5"),
      TabButton(image: "N4samurai", text: "N4"),
      TabButton(image: "N3samurai", text: "N3"),
      TabButton(image: "N2samurai", text: "N2"),
      TabButton(image: "N1samurai", text: "N1")
    ]
  }

  enum Action {
    case tabTapped(TabButton)
  }

  var body: some ReducerOf<Self> {
    Reduce<State, Action> { state, action in
      switch action {
      case .tabTapped(let tab):
        state.selectedTab = tab
        return .none
      }
    }
  }
}
